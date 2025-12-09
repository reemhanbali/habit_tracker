enum AppIconType {
  apple("assets/icons/ic_apple.svg"),
  facebook("assets/icons/ic_apple.svg"),
  google("assets/icons/ic_google.svg"),
  login("assets/icons/ic_login.svg"),
  arrowLeft("assets/icons/ic_arrow_left.svg"),
  clear("assets/icons/ic_clear.svg"),
  activeHome("assets/icons/ic_home.svg"),
  activeDiscovery("assets/icons/ic_discovery.svg"),
  activeMedal("assets/icons/ic_medal.svg"),
  activeProfile("assets/icons/ic_profile.svg"),
  inactiveHome("assets/icons/ic_home_off.svg"),
  inactiveDiscovery("assets/icons/ic_discovery_off.svg"),
  inactiveMedal("assets/icons/ic_medal_off.svg"),
  inactiveProfile("assets/icons/ic_profile_off.svg"),
  add("assets/icons/ic_add.svg");

  final String assetPath;
  const AppIconType(this.assetPath);
}
