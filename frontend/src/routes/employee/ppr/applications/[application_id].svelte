<script>
  import { page } from "$app/stores";
  import { onMount } from "svelte";
  import ApplicationDetails from "$lib/ppr/ApplicationDetails.svelte";
  import { getApplication } from "$lib/ppr/api";

  $: application = null;

  let reloadRetries = 0;
  let maxReloadRetries = 10;

  function reloadApplication(application_id) {
    getApplication(application_id)
      .then((response) => response.json())
      .then((data) => {
        application = data;
  
        if (!application.drafted_contract_file_id) {
          setTimeout(() => reloadApplication(application_id), 1000)
        }
      })
      .catch(err => console.log(err))
  }

  onMount(() => {
    reloadApplication($page.params.application_id);
  });
</script>

<div class="section">
  <div class="container">
    {#if application}
      <ApplicationDetails {application} />
    {/if}
  </div>
</div>
