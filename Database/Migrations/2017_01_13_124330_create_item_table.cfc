component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('items');

        table.increments('id');
        table.timestamps();
        table.integer('sheet').index();
        table.decimal('duration', 10, 2).default(0.00);
        table.longText('comment').nullable();
        table.foreign('sheet').references('sheets', 'id').onDelete('cascade');

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('items').drop();
    }
}
