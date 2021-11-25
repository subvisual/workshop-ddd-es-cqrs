<script context="module">
  export const prerender = true;
</script>

<nav class="navbar is-dark" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <span class="navbar-item">
      <a class="title has-text-white" href="/">#</a>
    </span>
  </div>
</nav>

<div class="section">
  <div class="container">
    <div class="columns">
      <div class="column is-6">
        <h1 class="title">PPRs</h1>
        <hr />
        <h2 class="subtitle">Employee:</h2>
        <div class="buttons">
          <a
            class="button is-primary is-medium is-fullwidth"
            href="/employee/ppr/applications/new">New Application</a
          >
        </div>
        <hr />
        <h2 class="subtitle">Company Manager:</h2>
        <div class="buttons">
          <a
            class="button is-primary is-medium is-fullwidth"
            href="/company-manager/ppr/applications">Application Approvals</a
          >
        </div>
        <hr>
        <h2 class="subtitle">Backoffice:</h2>
        <div class="buttons">
          <a
            class="button is-primary is-medium is-fullwidth"
            href="/backoffice/ppr/applications">Application Audits</a
          >
          <a
            class="button is-primary is-medium is-fullwidth"
            href="/backoffice/ppr">Metrics</a
          >
        </div>
      </div>
    </div>
  </div>
</div>
