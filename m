Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE81ECF2A
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 14:00:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgS43-00040W-5t
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 12:00:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jgS3q-0003zx-W4
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 11:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Hk+Xf1wGyT+0R7U7lPjkxvJW2wEfUn4B3Khmz5jQ1Q=; b=hRnj1mo629XO9b/VfwKEI2PzqF
 4l+ehdNsm+JfETblcQsFdh6JpGo9944x04rFkCsdIDfE+teYiINAxE1+cl/7W+lDyKIa6RK+fSM9r
 2I8qUPXG+dSlxvHp0KO+cPW1EfTTr9DBsUE6n/BVh2JlvCPAA86r5I8jKDeUG5CiVYZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Hk+Xf1wGyT+0R7U7lPjkxvJW2wEfUn4B3Khmz5jQ1Q=; b=RTV2ZFA3bW81On2MTYInbW5Uyw
 ygT5C+9tKWaWZrrej2B2B4n5K+wHlb0Tv/pkeZ6oTEnlhApImjywU0Kzo+6UuL2HGm9FHtXFNeFZZ
 pZcSgGU+oPKsDZ0yuRee7vWoJEZEIrIjS+fry3UYAaTfvqAYgaCyCXAO/fexnRfo75WY=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgS3p-007Pit-9F
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 11:59:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94970AC7F;
 Wed,  3 Jun 2020 11:59:53 +0000 (UTC)
Date: Wed, 3 Jun 2020 13:59:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200603115944.GF14855@linux-b0ei>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
 <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
 <20200603082503.GD14855@linux-b0ei>
 <20200603091830.azwneja736lvqo4n@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603091830.azwneja736lvqo4n@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgS3p-007Pit-9F
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: gregkh@linuxfoundation.org, jslaby@suse.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2020-06-03 10:18:30, Daniel Thompson wrote:
> On Wed, Jun 03, 2020 at 10:25:04AM +0200, Petr Mladek wrote:
> > On Wed 2020-06-03 12:52:15, Sumit Garg wrote:
> > > In kgdb context, calling console handlers aren't safe due to locks used
> > > in those handlers which could in turn lead to a deadlock. Although, using
> > > oops_in_progress increases the chance to bypass locks in most console
> > > handlers but it might not be sufficient enough in case a console uses
> > > more locks (VT/TTY is good example).
> > > 
> > > Currently when a driver provides both polling I/O and a console then kdb
> > > will output using the console. We can increase robustness by using the
> > > currently active polling I/O driver (which should be lockless) instead
> > > of the corresponding console. For several common cases (e.g. an
> > > embedded system with a single serial port that is used both for console
> > > output and debugger I/O) this will result in no console handler being
> > > used.
> > > 
> > > In order to achieve this we need to reverse the order of preference to
> > > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > > store "struct console" that represents debugger I/O in dbg_io_ops and
> > > while emitting kdb messages, skip console that matches dbg_io_ops
> > > console in order to avoid duplicate messages. After this change,
> > > "is_console" param becomes redundant and hence removed.
> > > 
> > > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > > index 4139698..6e182aa 100644
> > > --- a/drivers/tty/serial/kgdboc.c
> > > +++ b/drivers/tty/serial/kgdboc.c
> > > @@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> > >  	}
> > >  
> > >  	earlycon = con;
> > > +	kgdboc_earlycon_io_ops.cons = con;
> > >  	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
> > >  	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> > >  		earlycon = NULL;
> > 
> > Should we clear kgdboc_earlycon_io_ops.cons here when
> > kgdb_register_io_module() failed?
> > 
> > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > index c62d764..529116b 100644
> > > --- a/include/linux/kgdb.h
> > > +++ b/include/linux/kgdb.h
> > > @@ -276,8 +276,7 @@ struct kgdb_arch {
> > >   * the I/O driver.
> > >   * @post_exception: Pointer to a function that will do any cleanup work
> > >   * for the I/O driver.
> > > - * @is_console: 1 if the end device is a console 0 if the I/O device is
> > > - * not a console
> > > + * @cons: valid if the I/O device is a console; else NULL.
> > >   */
> > >  struct kgdb_io {
> > >  	const char		*name;
> > > @@ -288,7 +287,7 @@ struct kgdb_io {
> > >  	void			(*deinit) (void);
> > >  	void			(*pre_exception) (void);
> > >  	void			(*post_exception) (void);
> > > -	int			is_console;
> > > +	struct console		*cons;
> > 
> > Nit: I would call it "con". The trailing 's' makes me feel that that the
> >      variable points to an array or list of consoles.
> 
> How strongly do you feel about it?

I do not have strong opinion about it.

> I'd probably agree with you except that the uart subsystem, which is by
> far the most prolific supplier of consoles for kgdb to use, calls
> pointers to single consoles "cons" so I'd prefer to be aligned on
> terminology.

You made me curious ;-) I tried to find what names are used for
struct console variables.

$linux> git grep "struct console \*c" | sed -e "s/^.*\(struct console[[:blank:]]*\*c[a-z]*\).*$/\1/" | sort | uniq -c
     26 struct console *c
    181 struct console *co
     68 struct console *con
      7 struct console *cons
     28 struct console *console
      1 struct console *cs

and from tty subdirectory:

linux/drivers/tty> git grep "struct console \*c" | sed -e "s/^.*\(struct console[[:blank:]]*\*c[a-z]*\).*$/\1/" | sort | uniq -c
      8 struct console *c
    136 struct console *co
     35 struct console *con
      4 struct console *cons
     10 struct console *console
      1 struct console *cs


Anyway, feel free to use whatever you want. I prefer "con".
But "cons" still looks better than "co" ;-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
