<script>
  import { approve, reject } from "./api";

  export let applications;

  $: showApproveModal = false;
  $: showRejectModal = false;
  $: selectedApplication = null;

  let rejectionReason;

  function approveApplication(application) {
    selectedApplication = application;
    showApproveModal = true;
  }

  function closeApproveModal() {
    selectedApplication = null;
    showApproveModal = false;
  }

  function confirmApproveApplication() {
    approve(selectedApplication.application_id).then(() => {
      removeApplication(selectedApplication.application_id);
      closeApproveModal();
    });
  }

  function rejectApplication(application) {
    selectedApplication = application;
    showRejectModal = true;
  }

  function closeRejectModal() {
    selectedApplication = null;
    showRejectModal = false;
  }

  function confirmRejectApplication() {
    reject(selectedApplication.application_id, { reason: rejectionReason }).then(() => {
      removeApplication(selectedApplication.application_id);
      closeRejectModal();
    });
  }

  function removeApplication(application_id) {
    applications = applications.filter((app) => app.application_id !== application_id);
  }
</script>

<div>
  <p class="title is-size-4">PPR Applications</p>
  <p class="subtitle">Approvals</p>
  {#if applications}
    {#each applications as application}
      <div class="box">
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
                <a href={`/company-manager/employees/${application.employee_id}`}
                  >{application.employee_id}</a
                >
              </div>
            </div>
          </div>
          <div class="column is-3">
            <a href={`/company-manager/products/ppr/${application.product_id}`}>
              {application.product_id}
            </a>
          </div>
          <div class="column is-2">
            <p>{application.amount} &euro;</p>
          </div>
          <div class="column is-2">
            <p>{new Date(application.inserted_at).toLocaleDateString()}</p>
          </div>
          <div class="column has-text-right">
            <button class="button is-success" on:click={() => approveApplication(application)}>
              <span class="icon">
                <i class="fas fa-check" />
              </span>
            </button>
            <button class="button is-danger" on:click={() => rejectApplication(application)}>
              <span class="icon">
                <i class="fas fa-times" />
              </span>
            </button>
          </div>
        </div>
      </div>
    {/each}
    {#if showApproveModal && selectedApplication}
      <div class="modal is-active">
        <div class="modal-background" />
        <div class="modal-content">
          <div class="section">
            <div class="box has-text-centered">
              <p class="is-size-5">
                <span>Approve</span>
                <span class="has-text-weight-bold">{selectedApplication.product_id}</span>
                <span>for</span>
                <span class="has-text-weight-bold">{selectedApplication.employee_id}</span>
                <span>?</span>
              </p>
              <div class="mt-5">
                <button class="button is-primary" on:click={confirmApproveApplication}
                  >Approve</button
                >
                <button class="button" on:click={closeApproveModal}>Cancel</button>
              </div>
            </div>
          </div>
        </div>
        <button class="modal-close is-large" aria-label="close" on:click={closeApproveModal} />
      </div>
    {/if}
    {#if showRejectModal && selectedApplication}
      <div class="modal is-active">
        <div class="modal-background" />
        <div class="modal-content">
          <div class="box has-text-centered">
            <p class="is-size-5">
              <span>Reject</span>
              <span class="has-text-weight-bold">{selectedApplication.product_id}</span>
              <span>for</span>
              <span class="has-text-weight-bold">{selectedApplication.employee_id}</span>
              <span>?</span>
            </p>
            <div class="mt-4">
              <div class="field">
                <textarea
                  name="reason"
                  rows="2"
                  class="textarea"
                  placeholder="Rejection reason (optional)"
                  bind:value={rejectionReason}
                />
              </div>
            </div>
            <div class="mt-5">
              <button class="button is-primary" on:click={confirmRejectApplication}>Reject</button>
              <button class="button" on:click={closeRejectModal}>Cancel</button>
            </div>
          </div>
        </div>
        <button class="modal-close is-large" aria-label="close" on:click={closeRejectModal} />
      </div>
    {/if}
  {/if}
</div>
