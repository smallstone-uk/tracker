component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('headers');

        table.increments('id');
        table.timestamps();
        table.string('title');
        table.decimal('employeeRate', 10, 2).default(7.20);
        table.decimal('clientRate', 10, 2).default(35.00);

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('headers').drop();
    }
}
