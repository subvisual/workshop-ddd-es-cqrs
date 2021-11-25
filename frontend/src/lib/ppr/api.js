function route(url) {
  return "http://localhost:4000/api" + url;
}

export function getProducts() {
  return fetch(route(`/employee/ppr/products`));
}

export function getApplications() {
  return fetch(route(`/employee/ppr/applications`));
}

export function getApplication(id) {
  return fetch(route(`/employee/ppr/applications/${id}`));
}

export function getApplicationApprovals() {
  return fetch(route(`/company-manager/ppr/applications`));
}

export function getApplicationAudits() {
  return fetch(route(`/backoffice/ppr/applications`));
}

export function getApplicationAudit(id) {
  return fetch(route(`/backoffice/ppr/applications/${id}`));
}

export function getPolicyAudits() {
  return fetch(route(`/backoffice/ppr/policies`));
}

export function getPolicyAudit(id) {
  return fetch(route(`/backoffice/ppr/policies/${id}`));
}

export function getMetrics() {
  return fetch(route(`/backoffice/ppr`));
}

export function submit(params) {
  return fetch(route("/employee/ppr/applications"), {
    method: "POST",
    body: JSON.stringify(params),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

export function sign(id, params) {
  return fetch(route(`/employee/ppr/applications/${id}/sign`), {
    method: "POST",
    body: JSON.stringify(params),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

export function approve(id) {
  return fetch(route(`/company-manager/ppr/applications/${id}/approve`), {
    method: "POST",
  });
}

export function reject(id, params) {
  return fetch(route(`/company-manager/ppr/applications/${id}/reject`), {
    method: "POST",
    body: JSON.stringify(params),
    headers: {
      "Content-Type": "application/json",
    },
  });
}

export function markProcessing(id) {
  return fetch(route(`/backoffice/ppr/applications/${id}/mark_processing`), {
    method: "POST",
  });
}

export function issue(params) {
  return fetch(route(`/backoffice/ppr/policies`), {
    method: "POST",
    body: JSON.stringify(params),
    headers: {
      "Content-Type": "application/json",
    },
  });
}
