Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D525A4D2A7D
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Mar 2022 09:19:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRrXt-0004s4-EN
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Mar 2022 08:19:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nRrXr-0004rx-QF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 08:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TCM0UJU71vFmyCpvtGIqyRExM308THX8NeEE98HuLyw=; b=CszgRl0Alc0FtSxuXirO+EIdnd
 R1iAjdKfgARRlFYB/GRIZfc+F3jXB16kSZoOtjBIl3gGAkJOK+PvBEL74fWyFS383xejuMRPppIVw
 FNrgwoGroK8PkaIiYOfh+nvdaFr1v2cuhgWaOlMSZ+fIE9mNGAEo8eBixeoaNHoB75sQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TCM0UJU71vFmyCpvtGIqyRExM308THX8NeEE98HuLyw=; b=ihMupB3+ba+3Eu25weurSWqULi
 sNMmxc+mSSYE+oGfgy/psFdKwbFOSN7dG6zT2SgwXfNJ7Wkl7QcRKM5jnPRgmkZSyhWzZQEvQEp0u
 9w6OWe30LggI0Y2HCmfVTCv2+yDY4msUqaxIDy9ld9AJDMeA/itl/XVEuwIcl/szS8bM=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRrXj-0006qo-SC
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Mar 2022 08:19:42 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so4522070pjb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Mar 2022 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCM0UJU71vFmyCpvtGIqyRExM308THX8NeEE98HuLyw=;
 b=gwfkCt1GAlSaodP0da2aU5ijkHHXhqGoGlbjYk663NKD1SrXZapaIevPk4V/BUsure
 XiII23Bedvc2rrKNeyYHYgjzXv3KsoB/+4Ds30KpSr3Hr7y6/5lPopHFM4TlRI6kWXre
 Gw6nP8e1NrtRAvosc5MyiQqEphN740qAPvBYzGespEErPvbb8F4EihlrxY7PhQYVE09t
 WaoUfdZaOOMahJ4Qo03Y9jny8wu9pCQgUcmYnHbi5Zw/GeYRaMhj7D/cpJWfQf8j7eHj
 0sgV14InB6YZRPViUaBp6GXwi8BQZFWV84uGIwCxj5o9JwyIxCgGdEeVcECDAUVLL4eB
 imbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCM0UJU71vFmyCpvtGIqyRExM308THX8NeEE98HuLyw=;
 b=2d9PV5p33hVnqvReEgF67SXDtL9nBbKe0s7atGvi6YrgtWvTYoSetf3DA6BGl88U9A
 n5AEGE8oTvTg+RYTf3T5Ab+gH6jDOIyHkQQR00mLCKRbnAhH898em8LI4BJk5j58+UAX
 LGK0o6mz9i/DH51UN4xxtU5BN7U7GJVEIq5R6x1RG+7BNbQhgWvz1iMfjGV1+DUEI6kV
 b4FuQEK3A5J3k0SNuvUtfwYABTdXMXWr8GTU8mE1ICBB8eC8MrninF983wTO9b7tPSju
 vHz2lZZokJh1AW4cK+AhIAUtKY+19f4wPs6FoIxsbTZqCfnCk5VfHW0KlumvpKlWaa8V
 u9Vg==
X-Gm-Message-State: AOAM531utVS1DoSh6zJ3LJYAALoJmgEmZUtTszBgaZU2sPEG3UIa79m2
 C3e3AtmK6Z6Yz8d1EI6tlpT1MnmhiZpptCte2oVJLQ==
X-Google-Smtp-Source: ABdhPJz045akFz//p5zwqF9zhV51bLG2qLT/+7QeGLl2UBCq6zdhnpxyjgYFb71IUkYVcraRmuyxI8DKbl+UEJaKq6w=
X-Received: by 2002:a17:90b:1c03:b0:1bf:5720:f8a1 with SMTP id
 oc3-20020a17090b1c0300b001bf5720f8a1mr9120979pjb.100.1646813969912; Wed, 09
 Mar 2022 00:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307110328.2557655-1-sumit.garg@linaro.org>
 <20220307142356.ksx7k5xalqlsxnqk@maple.lan>
 <CAFA6WYNdc5fTk61GB2siLj-EkTtRE0u6fq-MtqF3Zt1uwJqJCw@mail.gmail.com>
 <20220308154601.2f2v4aqsny3ta52a@maple.lan>
In-Reply-To: <20220308154601.2f2v4aqsny3ta52a@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 9 Mar 2022 13:49:18 +0530
Message-ID: <CAFA6WYO7j7U89GgCH3ffZgFzGLES_ZqOO8Q6B_dbewZ0dCF+_w@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, gregkh@linuxfoundation.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 8 Mar 2022 at 21:16,
 Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > On Tue, Mar 08, 2022 at 08:13:43PM +0530, Sumit Garg wrote: >
 > Hi Daniel, > > > > On Mon, 7 Mar 2022 at 19:53, Dan [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nRrXj-0006qo-SC
Subject: Re: [Kgdb-bugreport] [RFT v4] tty/sysrq: Make sysrq handler NMI
 aware
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
Cc: hasegawa-hitomi@fujitsu.com, arnd@arndb.de, peterz@infradead.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 8 Mar 2022 at 21:16, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Tue, Mar 08, 2022 at 08:13:43PM +0530, Sumit Garg wrote:
> > Hi Daniel,
> >
> > On Mon, 7 Mar 2022 at 19:53, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > >
> > > On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote:
> > > > Allow a magic sysrq to be triggered from an NMI context. This is done
> > > > via marking some sysrq actions as NMI safe. Safe actions will be allowed
> > > > to run from NMI context whilst that cannot run from an NMI will be queued
> > > > as irq_work for later processing.
> > > >
> > > > <snip>
> > > >
> > > > @@ -566,12 +573,46 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> > > >               sysrq_key_table[i] = op_p;
> > > >  }
> > > >
> > > > +static atomic_t sysrq_key = ATOMIC_INIT(-1);
> > > > +
> > > > +static void sysrq_do_irq_work(struct irq_work *work)
> > > > +{
> > > > +     const struct sysrq_key_op *op_p;
> > > > +     int orig_suppress_printk;
> > > > +     int key = atomic_read(&sysrq_key);
> > > > +
> > > > +     orig_suppress_printk = suppress_printk;
> > > > +     suppress_printk = 0;
> > > > +
> > > > +     rcu_sysrq_start();
> > > > +     rcu_read_lock();
> > > > +
> > > > +     op_p = __sysrq_get_key_op(key);
> > > > +     if (op_p)
> > > > +             op_p->handler(key);
> > > > +
> > > > +     rcu_read_unlock();
> > > > +     rcu_sysrq_end();
> > > > +
> > > > +     suppress_printk = orig_suppress_printk;
> > > > +     atomic_set(&sysrq_key, -1);
> > > > +}
> > > > +
> > > > +static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
> > > > +
> > > >  void __handle_sysrq(int key, bool check_mask)
> > > >  {
> > > >       const struct sysrq_key_op *op_p;
> > > >       int orig_log_level;
> > > >       int orig_suppress_printk;
> > > >       int i;
> > > > +     bool irq_work = false;
> > > > +
> > > > +     /* Skip sysrq handling if one already in progress */
> > > > +     if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
> > > > +             pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> > > > +             return;
> > > > +     }
> > >
> > > Doesn't this logic needlessly jam sysrq handling if the irq_work cannot
> > > be undertaken?
> > >
> >
> > Here this is done purposefully to ensure synchronisation of three
> > contexts while handling sysrq:
> > 1. Thread context
> > 2. IRQ context
> > 3. NMI context
>
> Why is it necessary to provide such synchronization?
>
> Also, if there really is an existing bug in the way thread and irq
> contexts interact (e.g. something we can tickle without NMI being
> involved) then that should probably be tackled in a separate patch
> and with an explanation of the synchronization problem.
>
>
> > > A console user could unwittingly attempt an !nmi_safe SysRq action on
> > > a damaged system that cannot service interrupts. Logic that prevents
> > > things like backtrace, ftrace dump, kgdb or reboot is actively harmful
> > > to that user's capability to figure out why their original sysrq doesn't
> > > work.
> >
> > I see your point.
> >
> > >
> > > I think the logic to prohibht multiple deferred sysrqs should only
> > > be present on code paths where we are actually going to defer the sysrq.
> > >
> >
> > It's not only there to prohibit multiple deferred sysrq (as that alone
> > could be handled by irq_work_queue()) but rather to avoid parallelism
> > scenarios that Doug mentioned on prior versions.
>
> I'm afraid I'm still a little lost here. I've only done a quick review
> but sysrq's entry/exit protocols look like they are intended to handle
> stacked contexts. This shouldn't be all that suprising since, even
> without your changes, a sysrq triggered by an irq will interrupt
> a sysrq triggered using /proc/sysrq-trigger .
>

Yeah you are right. I see problems with how globals like
"suppress_printk" and "console_loglevel" are modified and restored
within __handle_sysrq(). A concurrent sysrq may easily lead to
incorrect value restoration as an example below:

Thread 1
                      Thread 2
orig_suppress_printk = suppress_printk; # here value is 1
suppress_printk = 0;

                            orig_suppress_printk = suppress_printk; #
here value is 0
suppress_printk = orig_suppress_printk; # here value is 1

                            suppress_printk = 0;

                            suppress_printk = orig_suppress_printk;
#incorrect value restored as 0

Greg,

Do let me know if I am missing something otherwise I will create a
separate patch for this issue.

-Sumit

>
> > How about the following add-on change to allow passthrough for broken
> > irq_work systems?
>
> My question ultimately boils down to whether the existing logic
> is necessary, not whether we can make it even more complex!
>
> So before thinking too much about this change I think it would be
> useful to have a clear example of the circumstances that you think
> it will not be safe to run an NMI-safe sysrq from an NMI.
>
>
> Daniel.
>
>
> > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > index 005c9f9e0004..0a91d3ccf862 100644
> > --- a/drivers/tty/sysrq.c
> > +++ b/drivers/tty/sysrq.c
> > @@ -608,6 +608,15 @@ void __handle_sysrq(int key, bool check_mask)
> >         int i;
> >         bool irq_work = false;
> >
> > +       /*
> > +        * Handle a case if irq_work cannot be undertaken on a damaged
> > +        * system stuck in hard lockup and cannot service interrupts.
> > +        * In such cases we shouldn't atleast block NMI safe handlers
> > +        * that doesn't depend on irq_work.
> > +        */
> > +       if (irq_work_is_pending(&sysrq_irq_work))
> > +               atomic_set(&sysrq_key, -1);
> > +
> >         /* Skip sysrq handling if one already in progress */
> >         if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
> >                 pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> >
> > -Sumit
> >
> > >
> > > Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
