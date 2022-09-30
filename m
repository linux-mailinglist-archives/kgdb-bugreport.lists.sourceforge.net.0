Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 726995F06B3
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Sep 2022 10:40:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oeBZ4-00055j-5q
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Sep 2022 08:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1oeBYn-00055R-Kc
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 08:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yvMtSmGbUu03O8o8mZRaHkMNTqo368k0r4sUED/TlJ8=; b=S1g79PpJXV21shYjayXC5dTwpk
 7P1U/4OAptPA7zCA5CnnOUPobnruLAuFKUPS0/ca6UasGTYKOIMNANknTvBCq21fJn2IoR8gkvES9
 gjRFse15ufbAcYoiKTemPVVDsp7J0JvOawYdmU8v9bQUPLro4bzx5SwVNvSfhUAHYoEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yvMtSmGbUu03O8o8mZRaHkMNTqo368k0r4sUED/TlJ8=; b=RNTTNIQ9QtKKsaPZkwB+6urall
 VpzwKSyie59SMl+f60hVKG140G4wBeE69KXtwp3Gk1xQa5Mzy1cqIEFbIjYTVC3vBWIF0ORWM4sT7
 HOFV9txo/6Lig4FRwuhHKVnKKwgOkxYTkrIGdtW+eZl3ix9DObwdEuTxpIznkDMXyJf8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeBYz-007ewa-C6 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 08:40:06 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 202781F88D;
 Fri, 30 Sep 2022 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664527199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yvMtSmGbUu03O8o8mZRaHkMNTqo368k0r4sUED/TlJ8=;
 b=IyayJPEEbLvzJ4Rc92dtdCpsLu/52+b8aMJMvDtsLBG1HhKYAb8GDlAMcmFhVxJCK1mZK3
 dJVgn+1MMxkClqD6SXEyZd+GsXxMSNDmZFRLj5HQy0+1ZCAtuwoFUZ+PBvc9tEddwFAu4H
 XS/oueVOcuhmQB+m58RQQ1F7+P3ttaM=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 970C92C178;
 Fri, 30 Sep 2022 08:39:58 +0000 (UTC)
Date: Fri, 30 Sep 2022 10:39:58 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <YzarXlj1NyFGTC08@alley>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-11-john.ogness@linutronix.de>
 <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-09-28 16:32:15, Doug Anderson wrote: > Hi, > >
 On Fri, Sep 23, 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de> wrote:
 > > > > From: Thomas Gleixner <tglx@linutronix.de> > > > > Pro [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oeBYz-007ewa-C6
Subject: Re: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that
 console list walk is safe
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Tomlin <atomlin@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2022-09-28 16:32:15, Doug Anderson wrote:
> Hi,
> 
> On Fri, Sep 23, 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de> wrote:
> >
> > From: Thomas Gleixner <tglx@linutronix.de>
> >
> > Provide a special list iterator macro for KGDB to allow unprotected list
> > walks and add a few comments to explain the hope based approach.
> >
> > Preperatory change for changing the console list to hlist and adding
> 
> s/Preperatory/Preparatory
> 
> > lockdep asserts to regular list walks.
> >
> > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > index af2aa76bae15..57a5fd27dffe 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -462,10 +462,13 @@ static void kgdboc_earlycon_pre_exp_handler(void)
> >          * we have no other choice so we keep using it.  Since not all
> >          * serial drivers might be OK with this, print a warning once per
> >          * boot if we detect this case.
> > +        *
> > +        * Pretend that walking the console list is safe...
> 
> To be fair, this is not quite as unsafe as your comment makes it
> sound. kgdb is a "stop the world" debugger and when this function is
> executing then all of the other CPUs in the system should have been
> rounded up and idle (or, perhaps, busy looping). Essentially as long
> as console list manipulation is always made in a way that each
> instruction keeps the list in a reasonable state then what kgdb is
> doing is actually "safe". Said another way: we could drop into the
> debugger at any point when a task is manipulating the console list,
> but once we're in the debugger and are executing the "pre_exp_handler"
> then all the other CPUs have been frozen in time.

The code in register_console()/unregister_console() seems to
manipulate the list in the right order. But the correctness
is not guaranteed because there are neither compiler nor
memory barriers.

That said, later patches add for_each_console_srcu(). IMHO,
the SRCU walk should be safe here.

> 
> >          */
> > -       for_each_console(con)
> > +       for_each_console_kgdb(con) {
> >                 if (con == kgdboc_earlycon_io_ops.cons)
> >                         return;
> > +       }
> >
> >         already_warned = true;
> >         pr_warn("kgdboc_earlycon is still using bootconsole\n");
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -558,7 +558,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >                 cp++;
> >         }
> >
> > -       for_each_console(c) {
> > +       /*
> > +        * This is a completely unprotected list walk designed by the
> > +        * wishful thinking department. See the oops_in_progress comment
> > +        * below - especially the encourage section...
> 
> The reality is also a little less dire here than the comment suggests.
> IMO this is actually not the same as the "oops_in_progress" case that
> the comment refers to.
>
> Specifically, the "oops_in_progress" is referring to the fact that
> it's not uncommon to drop into the debugger when a serial driver (the
> same one you're using for kgdb) is holding its lock. Possibly it's
> printing something to the tty running on the UART dumping stuff out
> from the kernel's console. That's not great and I won't pretend that
> the kgdb design is amazing here, but...
>
> Just like above, I don't feel like iterating through the console list
> here without holding the lock is necessarily unsafe. Just like above,
> all the rest of the CPUs in the system are in a holding pattern and
> aren't actively executing any code. While we may have interrupted them
> at any given instruction, they won't execute any more instruction
> until we leave kgdb and resume running.

The atomic consoles might improve the situation. Well, the hand shake
will not really work because the current owner might be stopped.
But we will at least know that the port is not in a safe state.

Anyway, what about using the later added SRCU walk here?
After all, this is exactly what RCU is for, isn't it?

Best Regards,
Petr



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
