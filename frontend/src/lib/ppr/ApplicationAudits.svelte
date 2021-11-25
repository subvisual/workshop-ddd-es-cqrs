<script>
  export let applications;

  $: showIssueModal = false;
  $: showCloseModal = false;
  $: selectedApplication = null;

  function issue(application) {
    selectedApplication = application;
    showIssueModal = true;
  }

  function closeIssueModal() {
    selectedApplication = null;
    showIssueModal = false;
  }

  function submitIssue() {
    closeIssueModal();
  }

  function closeApplication(application) {
    selectedApplication = application;
    showCloseModal = true;
  }

  function closeCloseModal() {
    selectedApplication = null;
    showCloseModal = false;
  }

  function confirmCloseApplication() {
    closeCloseModal();
  }
</script>

<div>
  <p class="title is-size-4">PPR Applications</p>
  {#each applications as application}
    <div class="box application">
      <div class="columns is-mobile is-vcentered">
        <div class="column is-3">
          <div class="columns is-vcentered is-gapless is-mobile">
            <div class="column is-narrow">
              <a href={`/employees/${application.employee_id}`}>
                <figure class="image is-32x32 mr-2">
                  <img
                    alt={application.employee_id}
                    class="is-rounded"
                    src="https://bulma.io/images/placeholders/32x32.png"
                  />
                </figure>
              </a>
            </div>
            <div class="column">
              <a href={`/employees/${application.employee_id}`}>{application.employee_id}</a>
            </div>
          </div>
        </div>
        <div class="column is-2 has-text-centered is-capitalized">
          <a href={`/backoffice/companies/${application.tenant_id}`}>
            {application.tenant_id}
          </a>
        </div>
        <div class="column is-2">
          <p>
            <a href={`/backoffice/products/ppr/${application.product_id}`}>
              {application.product_id}
            </a>
          </p>
          <p>{application.events[0].payload.amount} &euro;</p>
        </div>
        <div class="column is-2">
          <p>{new Date(application.events[0].created_at).toLocaleDateString()}</p>
        </div>
        <div class="column has-text-right actions">
          <a
            href={`/backoffice/ppr/applications/${application.application_id}`}
            class="button is-size-7"
          >
            View
          </a>
          <button class="button is-size-7 is-success" on:click={() => issue(application)}>
            Issue
          </button>
          <button class="button is-size-7 is-danger" on:click={() => closeApplication(application)}>
            Close
          </button>
        </div>
      </div>
    </div>
  {/each}
  {#if showIssueModal && selectedApplication}
    <div class="modal is-active">
      <div class="modal-background" />
      <div class="modal-content">
        <div class="section">
          <div class="box has-text-centered">
            <p class="is-size-5" />
            <div class="mt-5">
              <button class="button is-primary" on:click={submitIssue}>Issue</button>
              <button class="button" on:click={closeIssueModal}>Cancel</button>
            </div>
          </div>
        </div>
      </div>
      <button class="modal-close is-large" aria-label="close" on:click={closeIssueModal} />
    </div>
  {/if}
  {#if showCloseModal && selectedApplication}
    <div class="modal is-active">
      <div class="modal-background" />
      <div class="modal-content">
        <div class="box has-text-centered">
          <p class="is-size-5">
            <span>Close</span>
            <span class="has-text-weight-bold">{selectedApplication.productName}</span>
            <span>application for</span>
            <span class="has-text-weight-bold">{selectedApplication.customerName}</span>
            <span>@</span>
            <span class="has-text-weight-bold">{selectedApplication.tenantName}</span>
            <span>?</span>
          </p>
          <div class="mt-4">
            <div class="field">
              <textarea name="reason" rows="2" class="textarea" placeholder="Reason (optional)" />
            </div>
          </div>
          <div class="mt-5">
            <button class="button is-danger" on:click={confirmCloseApplication}>Close</button>
            <button class="button" on:click={closeCloseModal}>Cancel</button>
          </div>
        </div>
      </div>
      <button class="modal-close is-large" aria-label="close" on:click={closeCloseModal} />
    </div>
  {/if}
</div>

<style>
  .application:hover .actions {
    display: block;
  }
  .actions {
    display: none;
  }
</style>
