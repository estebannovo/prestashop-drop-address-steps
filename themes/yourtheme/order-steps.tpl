{* Assign a value to 'current_step' to display current style *}
{capture name="url_back"}
{if isset($back) && $back}back={$back}{/if}
{/capture}
{if !isset($multi_shipping)}
    {assign var='multi_shipping' value='0'}
{/if}
{if !$opc}
  <ul id="order_step" class="step">
  	<!-- set class to apply -->
    <li class="{if $current_step=='summary'}step_current{else}{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address' || $current_step=='login'}step_done{else}step_todo{/if}{/if}">
    		{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address' || $current_step=='login'} 
    			<a href="{$link->getPageLink('order', true, NULL, "&multi-shipping={$multi_shipping}")}">
    			<!--{$link->getPageLink('order', true, NULL, "{$smarty.capture.url_back}&multi-shipping={$multi_shipping}")}-->
    				 1. {l s='Summary'} 
    			</a>
    		{else}
    			<span>1. {l s='Summary'}</span>
    		{/if}
    </li>
    <li class="{if $current_step=='login'}step_current{else}{if $current_step=='payment' || $current_step=='shipping' || $current_step=='address'}step_done{else}step_todo{/if}{/if}"> {if $current_step=='payment' || $current_step=='shipping' || $current_step=='address'} <a href="{$link->getPageLink('order', true, NULL, "&step=1&multi-shipping={$multi_shipping}")}"> 2. {l s='Login'} </a> {else} <span>2. {l s='Login'}</span> {/if} </li>
    <li id="step_end" class="{if $current_step=='payment'}step_current_end{else}step_todo{/if}"> <span>3. {l s='Payment'}</span> </li>
  </ul>
{/if} 
