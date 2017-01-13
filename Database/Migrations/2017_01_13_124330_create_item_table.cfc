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
        table.integer('header').index();
        table.decimal('duration', 10, 2).default(0.00);
        table.longText('comment').nullable();
        table.foreign('header').references('headers', 'id').onDelete('cascade');

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
