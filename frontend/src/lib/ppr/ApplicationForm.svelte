<script>
  import { goto } from "$app/navigation";
  import { onMount } from "svelte";
  import { submit, getProducts } from "./api";

  let amount = 0.0;
  let productId;
  let tenantId = "tenant-1";
  let customerId = "customer-1";
  let products = null;

  onMount(() => {
    getProducts()
      .then((response) => response.json())
      .then((data) => (products = data));
  });

  function onSubmit() {
    submit({ amount, product_id: productId, tenant_id: tenantId, employee_id: customerId })
      .then((response) => response.json())
      .then((data) => goto("/employee/ppr/applications/" + data.application_id));
  }
</script>

<div class="field">
  <label for="product" class="label">Product</label>
  <div class="control">
    <div class="select is-fullwidth">
      <select name="product" bind:value={productId}>
        <option value="">Select product...</option>
        {#if products}
          {#each products as product}
            <option value={product.product_id}>{product.name}</option>
          {/each}
        {/if}
      </select>
    </div>
  </div>
</div>
<div class="field">
  <label for="amount" class="label">Amount</label>
  <div class="control has-icons-right">
    <span class="icon is-small is-right"> &euro; </span>
    <input class="input" type="text" placeholder="0.00" bind:value={amount} />
  </div>
</div>
<hr />
<div class="field">
  <div class="control">
    <button class="button is-primary is-size-5 is-fullwidth" on:click={onSubmit}>
      Submit application
    </button>
  </div>
</div>
