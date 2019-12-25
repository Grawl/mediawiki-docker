<?php

// @see https:// www.mediawiki.org/wiki/Manual:Configuration_settings

// Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

$wgEnotifUserTalk = false;
$wgEnotifWatchlist = false;
$wgEmailAuthentication = true;

$wgUseInstantCommons = false;

$wgAuthenticationTokenVersion = "1";

/**
 * Guest access
 */
if (getenv('MEDIAWIKI_GUEST_READ') != '') {
	$wgGroupPermissions['*']['read'] = getenv('MEDIAWIKI_GUEST_READ');
}
if (getenv('MEDIAWIKI_GUEST_EDIT') != '') {
	$wgGroupPermissions['*']['edit'] = getenv('MEDIAWIKI_GUEST_EDIT');
}
if (getenv('MEDIAWIKI_GUEST_CREATEACCOUNT') != '') {
	$wgGroupPermissions['*']['createaccount'] = getenv('MEDIAWIKI_GUEST_CREATEACCOUNT');
}

// For attaching licensing metadata to pages, and displaying an
// appropriate copyright notice / icon. GNU Free Documentation
// License and Creative Commons licenses are supported so far.
// $wgRightsPage = ""; // Set to the title of a wiki page that describes your license/copyright
// $wgRightsUrl = "";
// $wgRightsText = "";
// $wgRightsIcon = "";

// Uncomment this to disable output compression
// $wgDisableOutputCompression = true;

// OPTIONAL: Enable VisualEditor's experimental code features
// $wgDefaultUserOptions['visualeditor-enable-experimental'] = 1;

/**
 * Logo
 */
$wgLogo = "/static/mediawiki.svg";
/**
 * Manifest
 */
$wgFavicon = '/static/manifest/favicon.ico';
$wgAppleTouchIcon = '/static/manifest/apple-touch-icon.png';
/**
 * MobileFrontend
 */
wfLoadExtension( 'MobileFrontend' );
$wgMFDefaultSkinClass = 'SkinVector';
