<script>
  import { onMount } from "svelte";
  import { getApplicationApprovals } from "$lib/ppr/api";

  import ApplicationApprovals from "$lib/ppr/ApplicationApprovals.svelte";

  $: applications = null;

  onMount(() => {
    getApplicationApprovals()
      .then((response) => response.json())
      .then((data) => {
        applications = data;
      });
  });
</script>

<div class="section">
  <div class="container">
    {#if applications}
      <ApplicationApprovals {applications} />
    {/if}
  </div>
</div>
