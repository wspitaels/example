#!/usr/bin/env bash

set -u

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  cat <<'EOF'
Usage: ./hacked-container-sim.sh

A harmless, colorful terminal simulation that looks like a container was hacked.
Press Ctrl+C to exit.
EOF
  exit 0
fi

# Colors
RED='\033[38;5;196m'
GREEN='\033[38;5;46m'
CYAN='\033[38;5;51m'
YELLOW='\033[38;5;226m'
MAGENTA='\033[38;5;201m'
WHITE='\033[1;37m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'

cleanup() {
  printf "\n${GREEN}Simulation ended. Container status: stable.${RESET}\n"
  tput cnorm 2>/dev/null || true
}

trap cleanup EXIT INT TERM

clear
tput civis 2>/dev/null || true

printf "${MAGENTA}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}\n"
printf "${MAGENTA}${BOLD}║            CONTAINER BREACH SIMULATION              ║${RESET}\n"
printf "${MAGENTA}${BOLD}║              (visual effect only)                   ║${RESET}\n"
printf "${MAGENTA}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}\n\n"

sleep 0.4

fake_steps=(
  "Scanning container namespaces"
  "Resolving pod metadata"
  "Hijacking pseudo TTY"
  "Injecting rainbow payload"
  "Escalating terminal drama"
  "Exfiltrating pixels"
)

for step in "${fake_steps[@]}"; do
  printf "${CYAN}[~]${RESET} %s ... " "$step"
  sleep 0.35
  printf "${GREEN}DONE${RESET}\n"
done

printf "\n${RED}${BOLD}!!! WARNING: ROOT ACCESS APPEARS COMPROMISED !!!${RESET}\n"
sleep 0.5

spinner='|/-\\'

for i in {1..35}; do
  idx=$((i % 4))
  spin_char="${spinner:$idx:1}"
  percent=$((i * 100 / 35))
  printf "\r${YELLOW}[${spin_char}] decrypting secrets: ${WHITE}%3d%%${RESET}" "$percent"
  sleep 0.07
done
printf "\n\n"

for i in {1..40}; do
  color=$((196 + (RANDOM % 30)))
  printf "\033[38;5;%sm" "$color"
  printf "[%02d:%02d:%02d] " "$((RANDOM % 24))" "$((RANDOM % 60))" "$((RANDOM % 60))"

  case $((RANDOM % 6)) in
    0) printf "kernel panic avoided; aesthetic mode engaged" ;;
    1) printf "shadow daemon: %08x" "$RANDOM" ;;
    2) printf "container escape failed (simulation guard active)" ;;
    3) printf "entropy siphon: +%d kb/s" "$((RANDOM % 999))" ;;
    4) printf "neon backdoor blinking on tty%d" "$((RANDOM % 9))" ;;
    5) printf "fake credential vault unlocked -> confetti" ;;
  esac

  printf "${RESET}\n"
  sleep 0.06
done

printf "\n${DIM}${WHITE}Launching terminal glitch storm...${RESET}\n"
sleep 0.35

for row in {1..12}; do
  line=""
  for col in {1..64}; do
    chars='@#$%&*+=?<>/\\[]{}~'
    pick=$((RANDOM % ${#chars}))
    line+="${chars:$pick:1}"
  done
  color=$((46 + RANDOM % 160))
  printf "\033[38;5;%sm%s${RESET}\n" "$color" "$line"
  sleep 0.04
done

printf "\n${GREEN}${BOLD}Simulation complete.${RESET} ${CYAN}No real intrusion occurred.${RESET}\n"
printf "${YELLOW}Tip:${RESET} rerun it whenever you want to spook your terminal 😎\n"
