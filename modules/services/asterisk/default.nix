{ config, pkgs, ... }:

{

  # Enable asterisk 
  services.asterisk.enable = true;

  environment.systemPackages = [
    pkgs.asterisk_22
    pkgs.linphonePackages.linphone-desktop
  ];

  services.asterisk.confFiles = {
      "extensions.conf" = ''
        [japam]

        ; Al marcar 101, llamamos al Trunk SIP de LiveKit enviando el número "777"
        exten => 101,1,NoOp(Llamando al Agente JAPAM)
          same => n,Dial(PJSIP/777@livekit)
          same => n,Hangup()


        [from-livekit]
        exten => 200,1,NoOp(Transferencia desde IA recibida)
          same => n,Dial(PJSIP/6002,30)
          same => n,Hangup()

          include => japam 

      '';

      "pjsip.conf" = ''
	; --- Transporte ---
	[transport-udp]
	type=transport
	protocol=udp
	bind=0.0.0.0:5060
	external_media_address=172.16.14.196
	external_signaling_address=172.16.14.196
	local_net=127.0.0.1/32
	local_net=172.16.0.0/19
		
	; --- Usuario de Livekit ---
		
	[livekit_identify]
	type=identify
	endpoint=livekit
	match=127.0.0.1
		
	[livekit_auth]
	type=auth
	auth_type=userpass
	password=cisco123
	username=asterisk_user
		
	[livekit_aor]
	type=aor
	contact=sip:127.0.0.1:5061
		
	[livekit]
	type=endpoint
	disallow=all
	allow=ulaw,alaw,opus
	; Configuración de Tiempos
	rtp_timeout=5
	rtp_timeout_hold=300
	; Configuración de Red
	direct_media=no
	rtp_symmetric=yes 
	force_rport=yes
	rewrite_contact=yes
	from_domain=127.0.0.1
	; Autenticación
	auth=livekit_auth
	outbound_auth=livekit_auth
	aors=livekit_aor
	; Transferencia 
	allow_transfer=yes
	context=from-livekit 
		
	; --- Extensión 6001 ---
	[6001]
	type=endpoint
	context=japam
	disallow=all
	allow=ulaw,alaw
	language=es
	direct_media=no
	force_rport=yes
        rtp_symmetric=yes
	rewrite_contact=yes 
	auth=6001-auth
	aors=6001-aor
		
	[6001-auth]
	type=auth
	auth_type=userpass
	password=cisco123
	username=6001
		
	[6001-aor]
	type=aor
	max_contacts=2
	qualify_frequency=60
	remove_existing=yes
		
	; --- Extensión 6002 ---
	[6002]
	type=endpoint
	context=japam
	disallow=all
	allow=ulaw,alaw
	language=es
	direct_media=no
	force_rport=yes
        rtp_symmetric=yes
        rewrite_contact=yes 
	auth=6002-auth
	aors=6002-aor
		
	[6002-auth]
	type=auth
	auth_type=userpass
	password=cisco123
	username=6002
		
	[6002-aor]
	type=aor
	max_contacts=2
	qualify_frequency=60

      '';

  };


}
