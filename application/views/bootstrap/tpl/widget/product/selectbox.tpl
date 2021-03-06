[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{if $oSelections}]

    <div class="input-group">
        <span class="input-group-addon">[{$oSelectionList->getLabel()}]</span>

        <span class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" [{if $editable === false}]disabled="disabled"[{/if}]>
            [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
            [{if $oActiveSelection}]
                [{$oActiveSelection->getName()}]
            [{elseif !$blHideDefault}]
                [{if $sFieldName == "sel" }]
                    [{oxmultilang ident="PLEASE_CHOOSE"}]
                [{else}]
                    [{oxmultilang ident="CHOOSE_VARIANT"}]
                [{/if}]
            [{/if}]
            <span class="caret"></span>
        </button>

        [{if $editable !== false}]
            <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
            <ul class="dropdown-menu">
                [{foreach from=$oSelections item=oSelection}]
                    <li [{if $oSelection->isActive()}]class="active"[{/if}]>
                        [{assign var="sSelectionValue" value=$oSelection->getValue()}]
                        <a data-selection-id="[{$sSelectionValue}]" href="[{$oSelection->getLink()}]">[{$oSelection->getName()}]</a>
                        [{oxscript add="(function(\$){ \$('a[data-selection-id=\\'$sSelectionValue\\']').on('click', function (e) { e.preventDefault(); \$(this).closest('form').submit(); } ) })(window.jQuery);"}]
                    </li>
                [{/foreach}]
            </ul>
        [{/if}]

        </span>
    </div>

    [{*
    <div class="dropDown [{$sJsAction}]">
        <p class="selectorLabel underlined [{if $editable === false}] js-disabled[{/if}]">
            <label>[{$oSelectionList->getLabel()}]:</label>
            [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
            [{if $oActiveSelection}]
                <span>[{$oActiveSelection->getName()}]</span>
            [{elseif !$blHideDefault}]
                <span [{if $blInDetails}]class="selectMessage"[{/if}]>
                [{if $sFieldName == "sel" }]
                    [{ oxmultilang ident="PLEASE_CHOOSE" }]
                [{else}]
                    [{ oxmultilang ident="CHOOSE_VARIANT" }]
                [{/if}]
            </span>
            [{/if}]
        </p>
        [{if $editable !== false}]
            <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]">
            <ul class="drop [{$sSelType|default:"vardrop"}] FXgradGreyLight shadow">
                [{if $oActiveSelection && !$blHideDefault}]
                    <li><a rel="" href="#">
                            [{if $sFieldName == "sel" }]
                                [{ oxmultilang ident="PLEASE_CHOOSE" }]
                            [{else}]
                                [{ oxmultilang ident="CHOOSE_VARIANT" }]
                            [{/if}]
                        </a></li>
                [{/if}]
                [{foreach from=$oSelections item=oSelection}]
                    <li class="[{if $oSelection->isDisabled()}]js-disabled disabled[{/if}]">
                        <a data-selection-id="[{$oSelection->getValue()}]" href="[{$oSelection->getLink()}]" class="[{if $oSelection->isActive()}]selected[{/if}]">[{$oSelection->getName()}]</a>
                    </li>
                [{/foreach}]
            </ul>
        [{/if}]
    </div>
    *}]
[{else}]
    <a href="[{$_productLink}]">
        [{if $sFieldName == "sel"}]
            [{oxmultilang ident="PLEASE_CHOOSE"}]
        [{else}]
            [{oxmultilang ident="CHOOSE_VARIANT"}]
        [{/if}]
    </a>
[{/if}]