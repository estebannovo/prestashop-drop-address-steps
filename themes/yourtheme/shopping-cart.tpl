{capture name=path}{l s='Your shopping cart'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}
<div class="main">
  <div class="col-main">
    <div class="cart row">
      <div class="page-title title-buttons">
        <h1 class="span6">{l s='Shopping cart summary'}</h1>
        {if !$opc}
            <button onclick="window.location='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}&amp;multi-shipping=1';" class="button btn-proceed-checkout btn-checkout" title="Proceed to Checkout" type="button"><span><span>{l s='Continuar con su Compra'}</span></span></button>
            {if Configuration::get('PS_ALLOW_MULTISHIPPING')}
            <button onclick="window.location='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}&amp;multi-shipping=1';" class="button btn-proceed-checkout btn-checkout" title="Proceed to Checkout" type="button"><span><span>{l s='Continuar con su Compra'}</span></span></button>
            {/if}     
            
            {/if} 
      </div>
      <div class="span12"> {if isset($account_created)}
        <p class="success"> {l s='Your account has been created.'} </p>
        {/if}
        
        
        
        {assign var='current_step' value='summary'}
        
        
        
        {include file="$tpl_dir./order-steps.tpl"}
        
        
        
        {include file="$tpl_dir./errors.tpl"} </div>
      
      <div class="span12">
        {if isset($empty)}
        <p class="warning">{l s='Your shopping cart is empty.'}</p>
        {elseif $PS_CATALOG_MODE}
        <p class="warning">{l s='This store has not accepted your new order.'}</p>
        {else} 
        <script type="text/javascript">



                        // <![CDATA[



                        var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';



                        var currencyRate = '{$currencyRate|floatval}';



                        var currencyFormat = '{$currencyFormat|intval}';



                        var currencyBlank = '{$currencyBlank|intval}';



                        var txtProduct = "{l s='product'}";



                        var txtProducts = "{l s='products'}";



                        var deliveryAddress = {$cart->id_address_delivery|intval};



                        // ]]>



                    </script>
        <p style="display:none" id="emptyCartWarning" class="warning">{l s='Your shopping cart is empty.'}</p>
        {if isset($lastProductAdded) AND $lastProductAdded}
        <div class="cart_last_product">
          <div class="cart_last_product_header">
            <div class="left">{l s='Last product added'}</div>
          </div>
          <a  class="cart_last_product_img" href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, $lastProductAdded.id_shop)|escape:'htmlall':'UTF-8'}"><img src="{$link->getImageLink($lastProductAdded.link_rewrite, $lastProductAdded.id_image, 'cart_defualt')}" alt="{$lastProductAdded.name|escape:'htmlall':'UTF-8'}"/></a>
          <div class="cart_last_product_content">
            <h5><a href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, null, $lastProductAdded.id_product_attribute)|escape:'htmlall':'UTF-8'}">{$lastProductAdded.name|escape:'htmlall':'UTF-8'}</a></h5>
            {if isset($lastProductAdded.attributes) && $lastProductAdded.attributes}<a href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, null, $lastProductAdded.id_product_attribute)|escape:'htmlall':'UTF-8'}">{$lastProductAdded.attributes|escape:'htmlall':'UTF-8'}</a>{/if} </div>
          <br class="clear" />
        </div>
        {/if}
        <p>{l s='Your shopping cart contains:'} <span id="summary_products_quantity">{$productNumber} {if $productNumber == 1}{l s='product'}{else}{l s='products'}{/if}</span></p>
        <div id="order-detail-content" class="table_block">
          <table class="data-table cart-table" id="shopping-cart-table">
            <colgroup>
            <col width="1">
            <col>
            <col width="1">
            <col width="1">
            <col width="1">
            <col width="1">
            <col width="1">
            </colgroup>
            <thead class="hidden-phone">
              <tr class="first last">
                <th rowspan="1">&nbsp;</th>
                <th rowspan="1"><span class="nobr">{l s='Product Name'}</span></th>
                <th rowspan="1"></th>
                <th colspan="1" class="a-center"><span class="nobr">{l s='Unit Price'}</span></th>
                <th class="a-center" rowspan="1">{l s='Qty'}</th>
                <th colspan="1" class="a-center">{l s='Subtotal'}</th>
                <th class="a-center" rowspan="1">&nbsp;</th>
              </tr>
            </thead>
            
            
            <tbody>
            
            {foreach $products as $product}
            
            
            
            {assign var='productId' value=$product.id_product}
            
            
            
            {assign var='productAttributeId' value=$product.id_product_attribute}
            
            
            
            {assign var='quantityDisplayed' value=0}
            
            
            
            {assign var='odd' value=$product@iteration%2}
            
            
            
            {assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId) || count($gift_products)}
            
            
            
            {* Display the product line *}
            
            
            
            {include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
            
            
            
            {* Then the customized datas ones*}
            
            
            
            {if isset($customizedDatas.$productId.$productAttributeId)}
            
            
            
            {foreach $customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] as $id_customization=>$customization}
            <tr id="product_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" class="product_customization_for_{$product.id_product}_{$product.id_product_attribute}_{$product.id_address_delivery|intval} {if $odd}odd{else}even{/if} customization alternate_item {if $product@last && $customization@last && !count($gift_products)}last_item{/if}">
              <td></td>
              <td colspan="3"> {foreach $customization.datas as $type => $custom_data}
                
                
                
                {if $type == $CUSTOMIZE_FILE}
                <div class="customizationUploaded">
                  <ul class="customizationUploaded">
                    {foreach $custom_data as $picture}
                    <li><img src="{$pic_dir}{$picture.value}_small" alt="" class="customizationUploaded" /></li>
                    {/foreach}
                  </ul>
                </div>
                {elseif $type == $CUSTOMIZE_TEXTFIELD}
                <ul class="typedText">
                  {foreach $custom_data as $textField}
                  <li> {if $textField.name}
                    
                    
                    
                    {$textField.name}
                    
                    
                    
                    {else}
                    
                    
                    
                    {l s='Text #'}{$textField@index+1}
                    
                    
                    
                    {/if}
                    
                    
                    
                    {l s=':'} {$textField.value} </li>
                  {/foreach}
                </ul>
                {/if}
                
                
                
                
                
                
                
                {/foreach} </td>
              <td class="cart_quantity" colspan="2"> {if isset($cannotModify) AND $cannotModify == 1} <span style="float:left">{if $quantityDisplayed == 0 AND isset($customizedDatas.$productId.$productAttributeId)}{$customizedDatas.$productId.$productAttributeId|@count}{else}{$product.cart_quantity-$quantityDisplayed}{/if}</span> {else}
                <div id="cart_quantity_button" class="cart_quantity_button" style="float:left"> <a rel="nofollow" class="cart_quantity_up" id="cart_quantity_up_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;token={$token_cart}")}" title="{l s='Add'}"><img src="{$img_dir}icon/quantity_up.gif" alt="{l s='Add'}" width="14" height="9" /></a><br />
                  {if $product.minimal_quantity < ($customization.quantity -$quantityDisplayed) OR $product.minimal_quantity <= 1} <a rel="nofollow" class="cart_quantity_down" id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;op=down&amp;token={$token_cart}")}" title="{l s='Subtract'}"> <img src="{$img_dir}icon/quantity_down.gif" alt="{l s='Subtract'}" width="14" height="9" /> </a> {else} <a class="cart_quantity_down" style="opacity: 0.3;" id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}" href="#" title="{l s='Subtract'}"> <img src="{$img_dir}icon/quantity_down.gif" alt="{l s='Subtract'}" width="14" height="9" /> </a> {/if} </div>
                <input type="hidden" value="{$customization.quantity}" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_hidden"/>
                <input size="2" type="text" value="{$customization.quantity}" class="cart_quantity_input" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"/>
                {/if} </td>
              <td class="cart_delete"> {if isset($cannotModify) AND $cannotModify == 1}
                
                
                
                {else}
                <div> <a rel="nofollow" class="cart_quantity_delete" id="{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "delete&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_customization={$id_customization}&amp;id_address_delivery={$product.id_address_delivery}&amp;token={$token_cart}")}">{l s='Delete'}</a> </div>
                {/if} </td>
            </tr>
            {assign var='quantityDisplayed' value=$quantityDisplayed+$customization.quantity}
            
            
            
            {/foreach}
            
            
            
            {* If it exists also some uncustomized products *}
            
            
            
            {if $product.quantity-$quantityDisplayed > 0}{include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}{/if}
            
            
            
            {/if}
            
            
            
            {/foreach}
            
            
            
            {assign var='last_was_odd' value=$product@iteration%2}
            
            
            
            {foreach $gift_products as $product}
            
            
            
            {assign var='productId' value=$product.id_product}
            
            
            
            {assign var='productAttributeId' value=$product.id_product_attribute}
            
            
            
            {assign var='quantityDisplayed' value=0}
            
            
            
            {assign var='odd' value=($product@iteration+$last_was_odd)%2}
            
            
            
            {assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId)}
            
            
            
            {assign var='cannotModify' value=1}
            
            
            
            {* Display the gift product line *}
            
            
            
            {include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
            
            
            
            {/foreach}
              </tbody>
            
            {if sizeof($discounts)}
            <tbody>
            
            {foreach $discounts as $discount}
            <tr class="cart_discount {if $discount@last}last_item{elseif $discount@first}first_item{else}item{/if}" id="cart_discount_{$discount.id_discount}">
              <td class="cart_discount_name" colspan="3">{$discount.name}</td>
              <td class="cart_discount_price"><span class="price-discount"> {if !$priceDisplay}{displayPrice price=$discount.value_real*-1}{else}{displayPrice price=$discount.value_tax_exc*-1}{/if} </span></td>
              <td class="cart_discount_delete">1</td>
              <td class="cart_discount_price"><span class="price-discount price">{if !$priceDisplay}{displayPrice price=$discount.value_real*-1}{else}{displayPrice price=$discount.value_tax_exc*-1}{/if}</span></td>
              <td class="price_discount_del"> {if strlen($discount.code)}<a href="{if $opc}{$link->getPageLink('order-opc', true)}{else}{$link->getPageLink('order', true)}{/if}?deleteDiscount={$discount.id_discount}" class="price_discount_delete" title="{l s='Delete'}">{l s='Delete'}</a>{/if} </td>
            </tr>
            {/foreach}
              </tbody>
            
            {/if}
          </table>
        </div>
        {if $show_option_allow_separate_package}
        <p>
          <input type="checkbox" name="allow_seperated_package" id="allow_seperated_package" {if $cart->
          allow_seperated_package}checked="checked"{/if} />
          <label for="allow_seperated_package">{l s='Send the available products first'}</label>
        </p>
        {/if}
        
        
        
        {if !$opc}
        
        
        
        {if Configuration::get('PS_ALLOW_MULTISHIPPING')}
        <p>
          <input type="checkbox" {if $multi_shipping}checked="checked"{/if} id="enable-multishipping" />
          <label for="enable-multishipping">{l s='I want to specify a delivery address for each individual product.'}</label>
        </p>
        {/if}
        
        
        
        {/if} 
        <script type="text/javascript">decorateTable('shopping-cart-table')</script>
      </div>
    </div>
    <div class="cart-collaterals row">
      <div class="span4"> {if $HOOK_SHOPPING_CART}
        <div id="HOOK_SHOPPING_CART">{$HOOK_SHOPPING_CART}</div>
        {else}
        <div class="shipping">
          <div class="shipping-form"> </div>
        </div>
        {/if} </div>
      <div class="span4">
      {if $voucherAllowed}  
        {if isset($errors_discount) && $errors_discount}
        <ul class="error">
          {foreach $errors_discount as $k=>$error}
          <li>{$error|escape:'htmlall':'UTF-8'}</li>
          {/foreach}
        </ul>
        {/if}
        <form action="{if $opc}{$link->getPageLink('order-opc', true)}{else}{$link->getPageLink('order', true)}{/if}" method="post" id="voucher">
          <div class="discount">
            <h2>{l s='Vouchers'}</h2>
            <div class="discount-form">
              <label for="coupon_code">{l s='Enter your coupon code if you have one.'}</label>
              <div class="input-box">
                <input type="text" class="input-text" id="discount_name" name="discount_name" value="{if isset($discount_name) && $discount_name}{$discount_name}{/if}" />
              </div>
              <div class="buttons-set">
                <p class="submit">
                  <input type="hidden" name="submitDiscount" />
                  <button  type="submit" name="submitAddDiscount" value="" class="button" ><span><span>{l s='Apply'}</span></span></button>
                </p>
              </div>
              {if $displayVouchers}
              <h4 class="title_offers">{l s='Take advantage of our offers:'}</h4>
              <div id="display_cart_vouchers"> {foreach $displayVouchers as $voucher} <span onclick="$('#discount_name').val('{$voucher.name}');return false;" class="voucher_name">{$voucher.name}</span> - {$voucher.description} <br />
                {/foreach} </div>
              {/if}
              </fieldset>
            </div>
          </div>
        </form>
        {/if} 
        &nbsp;
        </div>
      <div class="span4">
      <table class="data-table">
            {if $use_taxes}
            
            {if $priceDisplay}
            <tr class="cart_total_price">
              <td>{if $display_tax_label}{l s='Total products (tax excl.):'}{else}{l s='Total products:'}{/if}</td>
              <td class="price" id="total_product">{displayPrice price=$total_products}</td>
            </tr>
            {else}
            <tr class="cart_total_price">
              <td>{if $display_tax_label}{l s='Total products (tax incl.):'}{else}{l s='Total products:'}{/if}</td>
              <td class="price" id="total_product">{displayPrice price=$total_products_wt}</td>
            </tr>
            {/if}
            
            
            
            {else}
            <tr class="cart_total_price">
              <td>{l s='Total products:'}</td>
              <td class="price" id="total_product">{displayPrice price=$total_products}</td>
            </tr>
            {/if}
            
            {if $use_taxes}
            <tr class="cart_total_price">
              <td>{l s='Total (tax excl.):'}</td>
              <td class="price" id="total_price_without_tax">{displayPrice price=$total_price_without_tax}</td>
            </tr>
            <tr class="cart_total_tax">
              <td>{l s='Total tax:'}</td>
              <td class="price" id="total_tax">{displayPrice price=$total_tax}</td>
            </tr>
            {/if}
            <tr class="cart_total_price totals"> {if $use_taxes}
                <td id="total_price_container" style=""><strong>{l s='Grand Total'}</strong></td>
                <td class="price"><strong><span class="price">{displayPrice price=$total_price}</span></strong></td>
                {else}
                <td id="total_price_container" style=""><strong>{l s='Grand Total'}</strong> </td>
                <td class="price">
               <strong><span class="price">{displayPrice price=$total_price}</span></strong></td>
                {/if} </tr>
            
                
              </table>

        <div class="totals">
          
          {if !$opc}
              <button onclick="window.location='{if (isset($smarty.server.HTTP_REFERER) && strstr($smarty.server.HTTP_REFERER, 'order.php')) || isset($smarty.server.HTTP_REFERER) && strstr($smarty.server.HTTP_REFERER, 'order-opc') || !isset($smarty.server.HTTP_REFERER)}{$link->getPageLink('index')}{else}{$smarty.server.HTTP_REFERER|escape:'htmlall':'UTF-8'|secureReferrer}{/if}';" class="button btn-continue f-left" title="{l s='Continue shopping'}" type="button"><span><span>{l s='Continue shopping'}</span></span></button>
              <button onclick="window.location='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}';" class="button btn-proceed-checkout btn-checkout f-right" title="Continuar el proceso de pago" type="button"><span><span>{l s='Proceed to Checkout'}</span></span></button>
              {if Configuration::get('PS_ALLOW_MULTISHIPPING')}
              <button onclick="window.location='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}&amp;multi-shipping=1';" class="button btn-proceed-checkout btn-checkout multishipping-button multishipping-checkout " title="Proceed to Checkout" type="button"><span><span>{l s='Proceed to Checkout'}</span></span></button>
              {/if}
              {/if}
        </div>
      </div>      
      {if !empty($HOOK_SHOPPING_CART_EXTRA)}
      <div class="clear"></div>
      <div class="cart_navigation_extra">
        <div id="HOOK_SHOPPING_CART_EXTRA">{$HOOK_SHOPPING_CART_EXTRA}</div>
      </div>
      {/if}
      
      
      
      {/if} </div>
  </div>
</div>
