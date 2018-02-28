TEMPLATE=subdirs
CONFIG+=ordered

config_no_webos{
    SUBDIRS += qwayland-generic
}

config_wayland_egl {
    config_no_webos{
        SUBDIRS += qwayland-egl
    }
}

#The following integrations are only useful with QtCompositor
contains(CONFIG, wayland-compositor) {
    config_brcm_egl: \
        SUBDIRS += qwayland-brcm-egl

    config_xcomposite {
        config_egl: \
            SUBDIRS += qwayland-xcomposite-egl
        !contains(QT_CONFIG, opengles2):config_glx: \
            SUBDIRS += qwayland-xcomposite-glx
    }
}

