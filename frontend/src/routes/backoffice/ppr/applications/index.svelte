<script>
  import { onMount } from "svelte";
  import { getApplicationAudits } from "$lib/ppr/api";
  import ApplicationAudits from "$lib/ppr/ApplicationAudits.svelte";

  $: applications = null;

  onMount(() => {
    getApplicationAudits()
      .then((response) => response.json())
      .then((data) => {
        applications = data;
      });
  });
</script>

<div class="section">
  <div class="container">
    {#if applications}
      <ApplicationAudits {applications} />
    {/if}
  </div>
</div>
