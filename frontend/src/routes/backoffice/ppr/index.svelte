<script>
  import { getMetrics } from "$lib/ppr/api";

  import Metrics from "$lib/ppr/Metrics.svelte";
  import ValueStream from "$lib/ppr/ValueStream.svelte";
  import { onMount } from "svelte";

  $: metrics = null;

  onMount(() => {
    getMetrics()
      .then((response) => response.json())
      .then((data) => (metrics = data));
  });
</script>

<div class="section">
  <div class="container">
    <h1 class="title">PPR Metrics</h1>
    <div class="box">
      {#if metrics}
        <Metrics {metrics} />
      {/if}
    </div>
    <br>
    <p class="title is-size-5">Value Stream</p>
    <div class="box">
      <ValueStream />
    </div>
  </div>
</div>
