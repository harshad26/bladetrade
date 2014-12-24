class TransactionPreauthorizedJob < Struct.new(:transaction_id)

  include DelayedAirbrakeNotification

  # This before hook should be included in all Jobs to make sure that the service_name is
  # correct as it's stored in the thread and the same thread handles many different communities
  # if the job doesn't have host parameter, should call the method with nil, to set the default service_name
  def before(job)
    # Set the correct service name to thread for I18n to pick it
    transaction = Transaction.find(transaction_id)
    ApplicationHelper.store_community_service_name_to_thread_from_community_id(transaction.community.id)
  end

  def perform
    transaction = Transaction.find(transaction_id)
    TransactionMailer.transaction_preauthorized(transaction).deliver
    # Added By Harshad Patel
    TransactionMailer.transaction_inform_to_user(transaction).deliver
    TransactionMailer.transaction_inform_to_seller(transaction).deliver
  end
end
