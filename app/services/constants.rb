module Constants
  PERMISSIONS = {
  cases: {
    list: "cases:list",
    read: "cases:read",
    create: "cases:create",
    update: "cases:update",
    close: "cases:close",
    reopen: "cases:reopen",
    assign: "cases:assign",
    delete: "cases:delete"
  },
  case_items: {
    list: "case_items:list",
    read: "case_items:read",
    create: "case_items:create",
    update: "case_items:update",
    delete: "case_items:delete"
  },
  businesses: {
    list: "businesses:list",
    read: "businesses:read",
    create: "businesses:create",
    update: "businesses:update",
    delete: "businesses:delete"
  },
  business_locations: {
    list: "business_locations:list",
    read: "business_locations:read",
    create: "business_locations:create",
    update: "business_locations:update",
    delete: "business_locations:delete"
  },
  assets: {
    list: "assets:list",
    read: "assets:read",
    create: "assets:create",
    update: "assets:update",
    delete: "assets:delete"
  },
  customers: {
    list: "customers:list",
    read: "customers:read",
    create: "customers:create",
    update: "customers:update",
    delete: "customers:delete"
  },
  users: {
    list: "users:list",
    read: "users:read",
    create: "users:create",
    update: "users:update",
    delete: "users:delete"
  },
  security: {
    roles_manage: "roles:manage",
    permissions_assign: "permissions:assign",
    groups_manage: "groups:manage"
  }
}.freeze
end
