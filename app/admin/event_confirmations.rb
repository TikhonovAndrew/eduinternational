ActiveAdmin.register EventConfirmation do
	menu parent: "Registrations"
    permit_params :name, :email, :phone, :surname, :event_id
end
