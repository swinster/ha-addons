#!/usr/bin/with-contenv bashio
set +u

sed -i "s/{{HOSTNAME}}/$HOSTNAME/g" custom_component/whatsapp.py

if [[ ! -v HA_HOSTNAME ]] | [[ -z "$HA_HOSTNAME" ]]; then
    bashio::log.info "WhatsApp-HA is an Add-on."
else

    cp options.json /data
    bashio::log.info "WhatsApp-HA is a standalone container."
    bashio::log.info "Copied options.json file."
fi

mkdir -p config/custom_components/whatsapp
cp --recursive /custom_component/* config/custom_components/whatsapp/
bashio::log.info "Installed custom component."

node index