component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('projects');

        table.increments('id');
        table.timestamps();
        table.string('name');
        table.string('company');
        table.string('address1');
        table.string('address2');
        table.string('city');
        table.string('county');
        table.string('postcode');
        table.string('country');

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('projects').drop();
    }
}
