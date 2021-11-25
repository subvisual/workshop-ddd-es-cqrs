<script>
  import { page } from "$app/stores";
  import { sign } from "./api";

  export let application;

  let files;

  function onSubmit() {
    sign(application.application_id, {}).then(() => window.location.reload());
  }
</script>

<div class="columns">
  <div class="column">
    <p class="title">PPR</p>
    {#if application}
      <p class="subtitle is-size-6 is-italic">Application #{application.application_id}</p>
    {/if}
  </div>
  <div class="column is-narrow">
    <a href={`/backoffice/ppr/applications/${application.application_id}`} class="button">
      View as admin
    </a>
  </div>
</div>
<hr />
<div class="columns">
  <div class="column is-6">
    <div class="box">
      <p>Download the contract to review, sign and upload.</p>
      <br />
      <div class="mb-4">
        <span class="has-text-weight-bold">Product:</span>
        <span>{application.product_id}</span>
      </div>
      <div class="mb-4">
        <span class="has-text-weight-bold">Amount:</span>
        <span>{application.amount} &euro;</span>
      </div>
      {#if application.status === "submitted"}
        {#if application.drafted_contract_file_id}
          <div class="mb-4">
            <p class="label">Contract:</p>
            <a class="button" href={application.drafted_contract_file_id}>
              <span class="icon is-small">
                <i class="fas fa-file" />
              </span>
              <span> Download </span>
            </a>
          </div>
          <div class="mb-4">
            <p class="label">Upload signed contract:</p>
            <div class="file has-name">
              <label class="file-label">
                <input class="file-input" type="file" name="contract" bind:files />
                <span class="file-cta">
                  <span class="file-icon">
                    <i class="fas fa-upload" />
                  </span>
                  <span class="file-label"> Choose a file… </span>
                </span>
                {#if files}
                  <span class="file-name">
                    {files[0].name}
                  </span>
                {/if}
              </label>
            </div>
          </div>
          <div class="buttons mt-5">
            <button class="button is-primary is-fullwidth is-size-5" on:click={onSubmit}>
              <span> Upload and continue </span>
              <span class="ml-2"> &rightarrow; </span>
            </button>
          </div>
        {:else}
          <div class="buttons mt-5">
            <button class="button is-fullwidth is-size-5 is-loading" disabled />
          </div>
        {/if}
      {:else if application.status === "signed"}
        <div class="mb-4">
          <p class="label">Signed contract:</p>
          <a class="button" href={application.signed_contract_file_id}>
            <span class="icon is-small">
              <i class="fas fa-file" />
            </span>
            <span> Download </span>
          </a>
        </div>
        <div class="buttons mt-5">
          <button class="button is-fullwidth is-size-5" disabled> Waiting approval... </button>
        </div>
      {:else if application.status === "approved"}
        <div class="buttons mt-5">
          <button class="button is-fullwidth is-size-5" disabled> Issuing... </button>
        </div>
      {/if}
    </div>
  </div>
</div>
