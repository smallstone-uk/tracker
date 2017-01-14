component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('sheets');

        table.increments('id');
        table.timestamps();
        table.integer('projectID').index();
        table.foreign('projectID').references('projects', 'id').onDelete('cascade');
        table.string('title');
        table.decimal('employeeRate', 10, 2).default(7.20);
        table.decimal('clientRate', 10, 2).default(35.00);
        table.integer('invoiceNo').default(1000);

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('sheets').drop();
    }
}
