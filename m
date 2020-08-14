Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C407244B19
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 16:13:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6aSt-00026x-Tf
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 14:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k6aSs-00026k-Ow
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6PZ8SEi14GOn4eemrIumaJvvtU1n1XVq4pJkW36yXBk=; b=TTSiZDWlC79199SfEmYouuORdc
 rgCnXF+ov8HSwN3ATBbCT7wkX63U1dY8orK9Ba6mV7pbdX1Fha9RPxwDwqwzDlnbbnZPzLbKYI14P
 /offGcDFew0CKeVcE2IH0XhoBSTEMoRTtY1gTPWdEHoClYIp4v0FQOrwxnzEsoWvh+5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6PZ8SEi14GOn4eemrIumaJvvtU1n1XVq4pJkW36yXBk=; b=gIRYALUkHP6paG7EBQ/xT6xaDC
 0CtIiERzl+W5r6LhUEXokquD3o8lyQT6dUKhVvPeEDBefRXt43Y/5a9kjbOuO7av/Ea9pkIarKUpW
 vFOMCpuZZ9P8IBi1KL1U82b7BQ/3PsQ3G+4e1wFOdl6fbnXW2HT1E380QEgZeKJ9VC/E=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6aSb-007ANS-1Y
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:13:50 +0000
Received: by mail-wr1-f68.google.com with SMTP id f12so8463495wru.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6PZ8SEi14GOn4eemrIumaJvvtU1n1XVq4pJkW36yXBk=;
 b=CvF2QHFp4dtQ8JSyPXKF4iGM14sojy/LnkFyiEUZklVNL1xzcPzwFs2iqNHaNDjS86
 ZpST3rYJBrzHscIRaafOFU2hMTn9TMdku2PNOzgX9/q5xsYpX1GoMn9lwxL8qN/rdGLK
 JipZDXfuXtLOuDg9qNUBQ+tU0MBOUf7/3v5XpgmhEn4xB9ZPa4Qphj/1kczmJxscKFZu
 aRA9x5Xp8Imp0pgZE2KIyCC6/O4/t0m5dTwZCEAPDuIst0Rlkt7m4hC0UPiwMVWiSVus
 XZC5ra2JLCZ8uRObVZhzBfMsm9tbKB1jlSrBLrmvTfsPnL4s2nlZtrb1jHgDy09AtoSi
 Bw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6PZ8SEi14GOn4eemrIumaJvvtU1n1XVq4pJkW36yXBk=;
 b=G0HJs3x5Oy5P8+jPbxjA67xpBhL8LJLaNr5aYlBzjzGAX68/6gD6pd1RQ9XPO/UrVM
 JCyB51js2tlURVO3DLmmE+08iQwr6+qlw6Kr8MjBCkcyFRXTuPa55J/Ag+tBe0hdTywp
 BlLqHMcYdw9pI76eyUHS93Pj07HzcQ+5HiLB6Gn/idjAaB5s0CxL2W20UXdjljZtr9G+
 xYvumAvfpK7U7K316mrx3BgNKrzGIhOkxLkye5YwUBfEZntTPJgn2pcgqQVsNv+DMPK6
 ULwmgnTIY7GZ2YJAotL8hEnqZUi7prsgGziUBbJOr8xmx77haYAM2rxuWJEz7Kppa6bn
 A7Yw==
X-Gm-Message-State: AOAM531T2k4sXcWfCL94asix98iCzyRTOqcp6OxAdmKWEOe61m+JuGC0
 fFLk+l0IZtYEbU+Pp9uymr6EEA==
X-Google-Smtp-Source: ABdhPJxCC8utsMF5rcTC7pd5UreHosbOWpzJm+pexx9q3NTFjU3YtRWzMBbuKfztaLE4yRhty81uRQ==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr2939341wrv.177.1597414406559; 
 Fri, 14 Aug 2020 07:13:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b11sm14153744wrq.32.2020.08.14.07.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 07:13:24 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:13:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200814141322.lffebtamfjt2qrym@holly.lan>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k6aSb-007ANS-1Y
Subject: Re: [Kgdb-bugreport] [RFC 2/5] serial: core: Add framework to allow
 NMI aware serial drivers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Aug 14, 2020 at 04:47:11PM +0530, Sumit Garg wrote:
> On Thu, 13 Aug 2020 at 20:08, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Aug 13, 2020 at 7:19 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > On Thu, 13 Aug 2020 at 05:29, Doug Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Jul 21, 2020 at 5:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > >
> > > > > Add NMI framework APIs in serial core which can be leveraged by serial
> > > > > drivers to have NMI driven serial transfers. These APIs are kept under
> > > > > CONFIG_CONSOLE_POLL as currently kgdb initializing uart in polling mode
> > > > > is the only known user to enable NMI driven serial port.
> > > > >
> > > > > The general idea is to intercept RX characters in NMI context, if those
> > > > > are specific to magic sysrq then allow corresponding handler to run in
> > > > > NMI context. Otherwise defer all other RX and TX operations to IRQ work
> > > > > queue in order to run those in normal interrupt context.
> > > > >
> > > > > Also, since magic sysrq entry APIs will need to be invoked from NMI
> > > > > context, so make those APIs NMI safe via deferring NMI unsafe work to
> > > > > IRQ work queue.
> > > > >
> > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > ---
> > > > >  drivers/tty/serial/serial_core.c | 120 ++++++++++++++++++++++++++++++++++++++-
> > > > >  include/linux/serial_core.h      |  67 ++++++++++++++++++++++
> > > > >  2 files changed, 185 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > > > > index 57840cf..6342e90 100644
> > > > > --- a/drivers/tty/serial/serial_core.c
> > > > > +++ b/drivers/tty/serial/serial_core.c
> > > > > @@ -3181,8 +3181,14 @@ static bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)
> > > > >                 return true;
> > > > >         }
> > > > >
> > > > > +#ifdef CONFIG_CONSOLE_POLL
> > > > > +       if (in_nmi())
> > > > > +               irq_work_queue(&port->nmi_state.sysrq_toggle_work);
> > > > > +       else
> > > > > +               schedule_work(&sysrq_enable_work);
> > > > > +#else
> > > > >         schedule_work(&sysrq_enable_work);
> > > > > -
> > > > > +#endif
> > > >
> > > > It should be a very high bar to have #ifdefs inside functions.  I
> > > > don't think this meets it.  Instead maybe something like this
> > > > (untested and maybe slightly wrong syntax, but hopefully makes
> > > > sense?):
> > > >
> > > > Outside the function:
> > > >
> > > > #ifdef CONFIG_CONSOLE_POLL
> > > > #define queue_port_nmi_work(port, work_type)
> > > > irq_work_queue(&port->nmi_state.work_type)
> > > > #else
> > > > #define queue_port_nmi_work(port, work_type)
> > > > #endif
> > > >
> > > > ...and then:
> > > >
> > > > if (IS_ENABLED(CONFIG_CONSOLE_POLL) && in_nmi())
> > > >   queue_port_nmi_work(port, sysrq_toggle_work);
> > > > else
> > > >   schedule_work(&sysrq_enable_work);
> > > >
> > > > ---
> > > >
> > > > The whole double-hopping is really quite annoying.  I guess
> > > > schedule_work() can't be called from NMI context but can be called
> > > > from IRQ context?  So you need to first transition from NMI context to
> > > > IRQ context and then go and schedule the work?  Almost feels like we
> > > > should just fix schedule_work() to do this double-hop for you if
> > > > called from NMI context.  Seems like you could even re-use the list
> > > > pointers in the work_struct to keep the queue of people who need to be
> > > > scheduled from the next irq_work?  Worst case it seems like you could
> > > > add a schedule_work_nmi() that would do all the hoops for you.  ...but
> > > > I also know very little about NMI so maybe I'm being naive.
> > > >
> > >
> > > Thanks for this suggestion and yes indeed we could make
> > > schedule_work() NMI safe and in turn get rid of all this #ifdefs. Have
> > > a look at below changes:
> > >
> > > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > > index 26de0ca..1daf1b4 100644
> > > --- a/include/linux/workqueue.h
> > > +++ b/include/linux/workqueue.h
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/atomic.h>
> > >  #include <linux/cpumask.h>
> > >  #include <linux/rcupdate.h>
> > > +#include <linux/irq_work.h>
> > >
> > >  struct workqueue_struct;
> > >
> > > @@ -106,6 +107,7 @@ struct work_struct {
> > >  #ifdef CONFIG_LOCKDEP
> > >         struct lockdep_map lockdep_map;
> > >  #endif
> > > +       struct irq_work iw;
> >
> > Hrm, I was thinking you could just have a single queue per CPU then
> > you don't need to add all this extra data to every single "struct
> > work_struct".  I was thinking you could use the existing list node in
> > the "struct work_struct" to keep track of the list of things.  ...but
> > maybe my idea this isn't actually valid because the linked list might
> > be in use if we're scheduling work that's already pending / running?
> >
> > In any case, I worry that people won't be happy with the extra
> > overhead per "struct work_struct".  Can we reduce it at all?  It still
> > does feel like you could get by with a single global queue and thus
> > you wouldn't need to store the function pointer and flags with every
> > "struct work_struct", right?  So all you'd need is a single pointer
> > for the linked list?  I haven't actually tried implementing this,
> > though, so I could certainly be wrong.
> 
> Let me try to elaborate here:
> 
> Here we are dealing with 2 different layers of deferring work, one is
> irq_work (NMI safe) using "struct irq_work" and other is normal
> workqueue (NMI unsafe) using "struct work_struct".
> 
> So when we are in NMI context, the only option is to use irq_work to
> defer work and need to pass reference to "struct irq_work". Now in
> following irq_work function:
> 
> +void queue_work_nmi(struct irq_work *iw)
> +{
> +       struct work_struct *work = container_of(iw, struct work_struct, iw);
> +
> +       queue_work(system_wq, work);
> +}
> +EXPORT_SYMBOL(queue_work_nmi);
> 
> we can't find a reference to "struct work_struct" until there is 1:1
> mapping with "struct irq_work". So we require a way to establish this
> mapping and having "struct irq_work" as part of "struct work_struct"
> tries to achieve that. If you have any better way to achieve this, I
> can use that instead.

Perhaps don't consider this to be "fixing schedule_work()" but providing
an NMI-safe alternative to schedule_work().

Does it look better if you create a new type to map the two structures
together. Alternatively are there enough existing use-cases to want to
extend irq_work_queue() with irq_work_schedule() or something similar?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
