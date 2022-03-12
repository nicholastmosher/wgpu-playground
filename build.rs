fn main() {
    if cfg!(target_os = "linux") {
        // Needed if using X11
        println!("cargo:rustc-link-lib=X11");
        println!("cargo:rustc-link-lib=Xcursor");
        println!("cargo:rustc-link-lib=Xrandr");
        println!("cargo:rustc-link-lib=Xi");

        // Needed if using Wayland
        // println!("cargo:rustc-link-lib=vulkan");
    }
}
