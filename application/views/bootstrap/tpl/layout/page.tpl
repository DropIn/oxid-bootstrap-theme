[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    <div class="container">
        [{include file="layout/header.tpl"}]
        [{*
        [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
            [{ include file="widget/breadcrumb.tpl"}]
        [{/if}]*}]

        <div class="row">
            [{if $sidebar && $sidebar != "Right"}]
                <div class="col-md-3">
                    [{include file="layout/sidebar.tpl"}]
                </div>
            [{/if}]

            <div class="content [{if $sidebar}]col-md-9[{/if}]">
                [{include file="message/errors.tpl"}]
                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            </div>

            [{if $sidebar == "Right"}]
                <div class="col-md-3">
                    [{include file="layout/sidebar.tpl"}]
                </div>
            [{/if}]
        </div>

        [{include file="layout/footer.tpl"}]
    </div>
    [{*
    [{include file="widget/facebook/init.tpl"}]
    [{if $oView->isPriceCalculated() }]
        [{block name="layout_page_vatinclude"}]
            [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            [{assign var="tsBadge" value=""}]
            [{if $oView->getTrustedShopId()}]
                [{assign var="tsBadge" value="TsBadge"}]
            [{/if}]
                <div id="incVatMessage[{$tsBadge}]">
                    [{if $oView->isVatIncluded()}]
                        * <span class="deliveryInfo">[{ oxmultilang ident="PLUS_SHIPPING" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                    [{else}]
                        * <span class="deliveryInfo">[{ oxmultilang ident="PLUS" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                    [{/if}]
                </div>
            [{/oxifcontent }]
        [{/block}]
    [{/if}]
    *}]
[{/capture}]
[{include file="layout/base.tpl"}]