#! /usr/bin/env bash

source "${HOME}/.homesick/helper.sh"

get_os() {
	os="$(uname -s)"
	if [ "$os" = Darwin ]; then
		echo "apple-darwin"
	elif [ "$os" = Linux ]; then
		echo "unknown-linux-musl"
	else
		error "unsupported OS: $os"
	fi
}

get_arch() {
	arch="$(uname -m)"
	if [ "$arch" = x86_64 ]; then
		echo "x86_64"
	elif [ "$arch" = aarch64 ] || [ "$arch" = arm64 ]; then
		echo "aarch64"
	else
		error "unsupported architecture: $arch"
	fi
}

ARCHOS=$(grep arch /etc/os-release)

is_arch() {
    if [[ "${ARCHOS}" =~ "ID" ]]; then return 0; else return 1; fi

}

check_pacman() {
	# mutate the named array of the caller
	local -n b=$1
	shift
	local desired=("$@")
	local packages
	mapfile -t packages < <(pacman -Qe | sed -e 's/ /@/g')
	for n in "${desired[@]}"; do
		if ! has_version "$n" "${packages[@]}"; then
			b+=("${n}")
		fi
	done
}



echo "Installing basic packages"
if is_mac; then
	desired=(starship grc neofetch ncdu eza )
	missing=()
	check_brewed "missing" "${desired[@]}"
	if [[ "${#missing[@]}" -gt 0 ]]; then
		echo "(brew) installing ${missing[*]}"
		brew install "${missing[@]}"
	fi
elif is_arch; then
	desired=(starship grc neofetch ncdu eza asdf qwert)
	missing=()
	check_pacman "missing" "${desired[@]}"
		if [[ "${#missing[@]}" -gt 0 ]]; then
		echo "(yay) installing ${missing[*]}"
		sudo pacman -S "${missing[@]}"
	fi
else
	desired=(starship grc neofetch ncdu eza)
	missing=()
	check_dpkged "missing" "${desired[@]}"
	if [[ "${#missing[@]}" -gt 0 ]]; then
		echo "(apt) installing ${missing[*]}"
		#sudo apt-get -y update
		#sudo apt-get -y install "${missing[@]}"
	fi
fi
echo "Done installing missing packages"
