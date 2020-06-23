Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E063204C8E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Jun 2020 10:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jneRr-0003ET-CP
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Jun 2020 08:38:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jneRr-0003EL-09
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 08:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KiVJjoaQorxf1aimFNd74dt122rnXcG+vxwmqCOHMDo=; b=QqYG9DX63gYq48FMMVtkU+1WlH
 3T/w3zuaX1C4ZcAoqkIpdA1+4k4kN+szOMpvQNx/geeWaauytWFZt0a24OTM9B2rxvbEtk3xkaj9t
 wlUMzj/x3lPobi758eG+79IZrEQzMFDGIFMA0ufaxCGa87r6MVVLuYmCQC9MjNIWVJVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KiVJjoaQorxf1aimFNd74dt122rnXcG+vxwmqCOHMDo=; b=Yo1hQ3Op0CXzsYhmRuv0KfgPb2
 sf50ggIdWozOlj07kW9jbNtIZyplBkEvDGvDsc21uR0PbpHEdNwjcW5sVHSHbFeIRdXnI5JCWF/bO
 B8qf+xxFsuoO0+Eh2SWNdV5JhVzz7XTewyc5nRL+EFxONYmO8Bh/JeUK7GpKDuTMsDsM=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jneRZ-00CmJs-3n
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 08:38:30 +0000
Received: by mail-lj1-f196.google.com with SMTP id s1so22494553ljo.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Jun 2020 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KiVJjoaQorxf1aimFNd74dt122rnXcG+vxwmqCOHMDo=;
 b=NI3za5EgJxLvzW9m9oQ9YVc3q0wPCrYkmih73lGIBguvYIpizIxfepdV7BYBfzaPhl
 4KPVqFcernSjy0QxCidSqUecThjjNBWJ12EKGqru80AVzKZpFwhoCiTSjx68HaAVGn7N
 cAXOsi0uMsqhE0nsOry8VkDDxKb2To1rtR/uKzrbzPz5n6e3JjOQezlrggK5iolSifPX
 BJvj8lg3HlFZSPTi+dRz4v4dzVI+QB83BIXk+hvemBGusElDDayQcTcFU9tNU8ZOBOF5
 u/vnr9WhI2p+6YhtRu3pnY/FNb+RYS4Rk3SzjeVEsX/LQGw0wS9CHb+A+WmlL5q54xOY
 4r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KiVJjoaQorxf1aimFNd74dt122rnXcG+vxwmqCOHMDo=;
 b=bvgQCvL/tHXfPxwawjCDy4ZdAzzNEofngdvoh8/ZMGl+1+X6P6GlUhpEnIqX9yq/DF
 UrwjWR5nygM9dPVMHWWlGZGgCz6+NFQQuTt4sVnj+ZKpe0u7Bk1+U0o6qOOVJqa6of8d
 alokITIgHV0NIECrwXyyyDAq0VHeCHlZbq4zFYEmPpNujtKRcd4NVKJrVjTpljyH/9Af
 6gjgxKPdAlDPMLTiEPNUwVGjhPyVUh7BCH0ywAy1zIDp3FTD0EAlJu3bedZOcE+/Khet
 2Gd5MCwTLjpVtvY2bWRVkZd1zeNrd/4MtoSEodVWT9rOgucmiZBgw1Fq7r6dIOlvxdEM
 7O/w==
X-Gm-Message-State: AOAM531lm3Q8zsFX+vKX3fs856Kh1pEmKIRUmzWc5X5hfE56corwXD4W
 EvvwbTtOMJU3B+ZvwYzfdrYl3YOLDCkKFrr4ZpqEFA==
X-Google-Smtp-Source: ABdhPJyuMMGSafHUAwWJ7+9HsMPCEIVgc/PDX+AxQAiWFjsyrhwkg+FlZqfo0SvQI1JF0ffeLccNL3RpEJ0fnTVRjr0=
X-Received: by 2002:a2e:b4e6:: with SMTP id s6mr2099464ljm.372.1592901479193; 
 Tue, 23 Jun 2020 01:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
 <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
In-Reply-To: <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 14:07:47 +0530
Message-ID: <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1jneRZ-00CmJs-3n
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io
 ops table for kgdboc
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 22 Jun 2020 at 21:33, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jun 22, 2020 at 07:56:20PM +0530, Sumit Garg wrote:
> > From: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Add request_nmi() callback to install a non-maskable interrupt handler
> > corresponding to IRQ retrieved from polling interface. If NMI handler
> > installation fails due to missing support from underlying irqchip driver
> > then fallback to install it as normal interrupt handler.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/serial/kgdboc.c | 35 +++++++++++++++++++++++++++++++++++
> >  include/linux/kgdb.h        |  7 +++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > index 84ffede..263afae 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -19,6 +19,9 @@
> >  #include <linux/console.h>
> >  #include <linux/vt_kern.h>
> >  #include <linux/input.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdesc.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/serial_core.h>
> > @@ -390,12 +393,44 @@ static void kgdboc_post_exp_handler(void)
> >       kgdboc_restore_input();
> >  }
> >
> > +static int kgdb_tty_irq;
> > +
> > +static int kgdboc_request_nmi(irq_handler_t fn, void *dev_id)
> > +{
> > +     int irq, res;
> > +
> > +     /* Better to avoid double allocation in the tty driver! */
> > +     if (kgdb_tty_irq)
> > +             return 0;
> > +
> > +     if (!kgdb_tty_driver->ops->poll_get_irq)
> > +             return -ENODEV;
> > +
> > +     irq =
> > +         kgdb_tty_driver->ops->poll_get_irq(kgdb_tty_driver, kgdb_tty_line);
> > +     if (irq <= 0)
> > +             return irq ? irq : -ENODEV;
> > +
> > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > +     res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
>
> Why do we need IRQF_PERCPU here. A UART interrupt is not normally
> per-cpu?
>

Have a look at this comment [1] and corresponding check in
request_nmi(). So essentially yes UART interrupt is not normally
per-cpu but in order to make it an NMI, we need to request it in
per-cpu mode.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n2112

>
> > +     if (res) {
> > +             res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
>
> IRQF_SHARED?
>
> Currrently there is nothing that prevents concurrent activation of
> ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
> becomes possible for both drivers to try to service the same interrupt.
> That risks some rather "interesting" problems.
>

Could you elaborate more on "interesting" problems?

BTW, I noticed one more problem with this patch that is IRQF_SHARED
doesn't go well with IRQ_NOAUTOEN status flag. Earlier I tested it
with auto enable set.

But if we agree that both shouldn't be active at the same time due to
some real problems(?) then I can rid of IRQF_SHARED as well. Also, I
think we should unregister underlying tty driver (eg. /dev/ttyAMA0) as
well as otherwise it would provide a broken interface to user-space.

-Sumit

>
> Daniel.
>
>
> > +             WARN_ON(res);
> > +     }
> > +
> > +     enable_irq(irq);
> > +
> > +     kgdb_tty_irq = irq;
> > +     return 0;
> > +}
> > +
> >  static struct kgdb_io kgdboc_io_ops = {
> >       .name                   = "kgdboc",
> >       .read_char              = kgdboc_get_char,
> >       .write_char             = kgdboc_put_char,
> >       .pre_exception          = kgdboc_pre_exp_handler,
> >       .post_exception         = kgdboc_post_exp_handler,
> > +     .request_nmi            = kgdboc_request_nmi,
> >  };
> >
> >  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index 529116b..b32b044 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -16,6 +16,7 @@
> >  #include <linux/linkage.h>
> >  #include <linux/init.h>
> >  #include <linux/atomic.h>
> > +#include <linux/interrupt.h>
> >  #ifdef CONFIG_HAVE_ARCH_KGDB
> >  #include <asm/kgdb.h>
> >  #endif
> > @@ -276,6 +277,10 @@ struct kgdb_arch {
> >   * the I/O driver.
> >   * @post_exception: Pointer to a function that will do any cleanup work
> >   * for the I/O driver.
> > + * @request_nmi: Pointer to a function that can install an non-maskable
> > + * interrupt handler that will be called when a character is pending and that
> > + * can be cleared by calling @read_char until it returns NO_POLL_CHAR. If NMI
> > + * installation fails then fallback to install normal interrupt handler.
> >   * @cons: valid if the I/O device is a console; else NULL.
> >   */
> >  struct kgdb_io {
> > @@ -287,6 +292,8 @@ struct kgdb_io {
> >       void                    (*deinit) (void);
> >       void                    (*pre_exception) (void);
> >       void                    (*post_exception) (void);
> > +     int                     (*request_nmi)(irq_handler_t nmi_handler,
> > +                                            void *dev_id);
> >       struct console          *cons;
> >  };
> >
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
