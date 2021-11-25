<script>
  import ApplicationForm from "$lib/ppr/ApplicationForm.svelte";
</script>

<div class="section">
  <div class="container">
    <div>
      <p class="title">PPR</p>
      <p class="subtitle">New Application</p>
    </div>
    <hr />
    <div class="columns">
      <div class="column is-6">
        <div class="box">
          <p>Select a product and set the amount you want to invest.</p>
          <br />
          <ApplicationForm />
        </div>
      </div>
    </div>
  </div>
</div>
