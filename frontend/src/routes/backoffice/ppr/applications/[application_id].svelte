<script>
  import ApplicationAudit from "$lib/ppr/ApplicationAudit.svelte";

  import { page } from "$app/stores";

  import { onMount } from "svelte";
  import { getApplicationAudit } from "$lib/ppr/api";

  $: application = null;

  onMount(() => {
    getApplicationAudit($page.params.application_id)
      .then((response) => response.json())
      .then((data) => {
        application = data;
      });
  });
</script>

<div class="section">
  <div class="container">
    {#if application}
      <ApplicationAudit {application} />
    {/if}
  </div>
</div>
