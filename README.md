# Authy Forms Helpers

This javascripts and stylesheets help you build your Registration and
Verification forms to use Authy quicker.
They include:

1. An awesome countries dropdown that selects between country name and country
   code

2. Some javascripts validations on tokens and cellphones

3. A tooltip you can use to add a help message when you ask for the token


## CDN

You can copy manually the javascripts and stylesheets into your project or you can simply use authy website to serve them:

    Compressed CSS: https://www.authy.com/form.authy.min.css"
    Compressed JS: https://www.authy.com/form.authy.min.js"

Add this in your HTML \<head\>

    <link href="https://www.authy.com/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">
    <script src="https://www.authy.com/form.authy.min.js" type="text/javascript"></script>

or you can use CloudFlare CDN:

    Compressed CSS: //cdnjs.cloudflare.com/ajax/libs/authy-forms.css/2.0/form.authy.min.css
    Compressed JS: //cdnjs.cloudflare.com/ajax/libs/authy-forms.js/2.0/form.authy.min.js

    <link href="//cdnjs.cloudflare.com/ajax/libs/authy-forms.css/2.0/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/authy-forms.js/2.0/form.authy.min.js" type="text/javascript"></script>


## Registration form (user enabling two factor)

In  this form you need the `country code` and the user `cellphone`

##### Get the Countries Dropdown:

Add `authy-countries` id to the Country input.

    <select id="authy-countries"></select>

To see a demo open sample/register.html and look at the Country input.

###### Display the country code as number

Add `data-show-as="number"` to the Country input.

    <select id="authy-countries" data-show-as="number"></select>

##### Cellphone validations:

Add `authy-cellphone` id to the cellphone input.


    <input id="authy-cellphone"  type="text" value=""/>

To see a demo open sample/register.html and look at the cellphone input.


## Two-factor verification form

On this form the user enters his `token` which he gets from his cellphone


#### Token validation

To see a demo open sample/login.html and look at the cellphone input.

Add `authy-token` id to the input.

    <input id="authy-token"  type="text" value=""/>

To see a demo open sample/login.html and look at the cellphone input.

#### Authy input logo

To see a demo open sample/login.html and look at the cellphone input.

Add `authy-token` id to the input.

    <input id="authy-token"  type="text" value=""/>

To see a demo open sample/login.html and look at the cellphone input.

#### Help tooltip

First set the help message you want:

    var authyUI = Authy.UI.instance();
    authyUI.setTooltip("Two-Factor", "Get this token from your cellphone");

Add `authy-help` id to the link.

    <a href="#" id="authy-help">help</a>

To see a demo open sample/login.html and look at the cellphone input.


## Need help?

E-mail us at support@authy.com

 use
