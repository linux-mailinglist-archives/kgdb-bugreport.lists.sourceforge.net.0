Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3624D1CE0
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 17:11:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRcRE-0005oO-Sn
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 16:11:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1nRcR3-0005nR-RX
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 16:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LK9uf9V8m3oUibOnNP7wgnje39NrA7Q39n1xrUjRn4w=; b=YOj6xLFIzt/+UC5wMp010KqGk6
 q/WWtx76+08oZmAy13mQTWP7D81mxkmIWTaOrp1v5VOJtrnGmVUhPfqzcDMnLQj3jq4+MFxPtfm75
 DbY33JUf2WrwH1FJbRBa61nx5i202MwBnzc7PO+VTuRqwGbx7Ol0thaipG9yeQlg0AfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LK9uf9V8m3oUibOnNP7wgnje39NrA7Q39n1xrUjRn4w=; b=NeiSOtVie41A3uj+j7caKyOyrD
 ecPry5vFJeN1wHB2JtmTF0Ayh6g5Qu/1X2ZV96o1TaO6iX5PO2xz+L3JJS6yUlQkb/GIdv3pZWxWP
 gzhSxMaJ/f7FR14WeaLnZ1EJtjG37RxGhm6T2xalMnTgAQADbpod+mmu0dRETxJtcgNY=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRcQx-008l4C-NS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 16:11:40 +0000
Received: by mail-ej1-f47.google.com with SMTP id bg10so40374343ejb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 08:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LK9uf9V8m3oUibOnNP7wgnje39NrA7Q39n1xrUjRn4w=;
 b=Ie+UyZFVWo5ezaet+8lp260zEbCp6993EFkmk1mHPI9jhs8nlRncCPwQCSETo00K0H
 pR3SzTiNfIkATsEYxTt9yo5CKqDsYAVwOsD8QnHQgTiW5fVT1llyZdkVx1VRS9fAoVFG
 8+iw72UO6+fq2WVAnl9tmvCXwq90akGOAA/85Ykl4vACoans4WkGLlEWgjuv3CLEVacK
 rGXAvbkrOa1zVd73Wl4HDFtyacx5e2YlmCbtaFEzyCIA18hUSn9CXBmCUh19KDQMpgo8
 ebQOiOdN9fksKEhhLR8zhFMGq+kOb0acyH1Eup5qkPf32k1V69yKsvA2POdpsXF1G+wI
 k5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LK9uf9V8m3oUibOnNP7wgnje39NrA7Q39n1xrUjRn4w=;
 b=KTQcr8fprnUhAL5GQO0forXPzfAzzdnZKQoSXHA7W01myyTyRMZCCxgq0NFDXetOkp
 yPVcxr4NaDZzNO4fRP7lJgErK6uQzSHd6ZuHMjsgHi1MG0VC06x9QA2Q+2kaTvXXok7f
 HEnY32jZXK9e0b1VIqBQt8OzWY1hC80vUktzwTtlsXlS8vjJL9QUmHk9w6TDMNFDkPTP
 YeLVf4mHSAVox0lL/A5OQsZjiBTh1ICaAF99TsgpIw4VMZNrBRC2U12asBF+jTRV/+In
 T3ngFp2L6N1AEnO1nVqHbSW80H3ru8as6OsCo7ScRKrx6rVAvSeWMsssZ+e7+yLbGZE5
 NdhA==
X-Gm-Message-State: AOAM53175pKiqMcBfzwLfO5VHGm16SrNzFNT8EklluZ8NikK8j4ybpwK
 z9EDDqyT95uNA2omYk/lluAMFgyG4UNnH7nh
X-Google-Smtp-Source: ABdhPJwTJKvEz01X94pGA38KQdbjDZPWxtj4C1+0HF/sD9kUnvvEoIEZhWxTc2QmjdZunG1Rm2MuTw==
X-Received: by 2002:adf:fb47:0:b0:1ed:9f2c:492e with SMTP id
 c7-20020adffb47000000b001ed9f2c492emr12858210wrs.196.1646754363872; 
 Tue, 08 Mar 2022 07:46:03 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b00380e45cd564sm2817117wmq.8.2022.03.08.07.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 07:46:03 -0800 (PST)
Date: Tue, 8 Mar 2022 15:46:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20220308154601.2f2v4aqsny3ta52a@maple.lan>
References: <20220307110328.2557655-1-sumit.garg@linaro.org>
 <20220307142356.ksx7k5xalqlsxnqk@maple.lan>
 <CAFA6WYNdc5fTk61GB2siLj-EkTtRE0u6fq-MtqF3Zt1uwJqJCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNdc5fTk61GB2siLj-EkTtRE0u6fq-MtqF3Zt1uwJqJCw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 08, 2022 at 08:13:43PM +0530, Sumit Garg wrote:
 > Hi Daniel, > > On Mon, 7 Mar 2022 at 19:53,
 Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > > > On Mon, Mar 07, 2022 at 04:33:28PM [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nRcQx-008l4C-NS
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
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 08, 2022 at 08:13:43PM +0530, Sumit Garg wrote:
> Hi Daniel,
> 
> On Mon, 7 Mar 2022 at 19:53, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> >
> > On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote:
> > > Allow a magic sysrq to be triggered from an NMI context. This is done
> > > via marking some sysrq actions as NMI safe. Safe actions will be allowed
> > > to run from NMI context whilst that cannot run from an NMI will be queued
> > > as irq_work for later processing.
> > >
> > > <snip>
> > >
> > > @@ -566,12 +573,46 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> > >               sysrq_key_table[i] = op_p;
> > >  }
> > >
> > > +static atomic_t sysrq_key = ATOMIC_INIT(-1);
> > > +
> > > +static void sysrq_do_irq_work(struct irq_work *work)
> > > +{
> > > +     const struct sysrq_key_op *op_p;
> > > +     int orig_suppress_printk;
> > > +     int key = atomic_read(&sysrq_key);
> > > +
> > > +     orig_suppress_printk = suppress_printk;
> > > +     suppress_printk = 0;
> > > +
> > > +     rcu_sysrq_start();
> > > +     rcu_read_lock();
> > > +
> > > +     op_p = __sysrq_get_key_op(key);
> > > +     if (op_p)
> > > +             op_p->handler(key);
> > > +
> > > +     rcu_read_unlock();
> > > +     rcu_sysrq_end();
> > > +
> > > +     suppress_printk = orig_suppress_printk;
> > > +     atomic_set(&sysrq_key, -1);
> > > +}
> > > +
> > > +static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
> > > +
> > >  void __handle_sysrq(int key, bool check_mask)
> > >  {
> > >       const struct sysrq_key_op *op_p;
> > >       int orig_log_level;
> > >       int orig_suppress_printk;
> > >       int i;
> > > +     bool irq_work = false;
> > > +
> > > +     /* Skip sysrq handling if one already in progress */
> > > +     if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
> > > +             pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> > > +             return;
> > > +     }
> >
> > Doesn't this logic needlessly jam sysrq handling if the irq_work cannot
> > be undertaken?
> >
> 
> Here this is done purposefully to ensure synchronisation of three
> contexts while handling sysrq:
> 1. Thread context
> 2. IRQ context
> 3. NMI context

Why is it necessary to provide such synchronization?

Also, if there really is an existing bug in the way thread and irq
contexts interact (e.g. something we can tickle without NMI being
involved) then that should probably be tackled in a separate patch
and with an explanation of the synchronization problem.


> > A console user could unwittingly attempt an !nmi_safe SysRq action on
> > a damaged system that cannot service interrupts. Logic that prevents
> > things like backtrace, ftrace dump, kgdb or reboot is actively harmful
> > to that user's capability to figure out why their original sysrq doesn't
> > work.
> 
> I see your point.
> 
> >
> > I think the logic to prohibht multiple deferred sysrqs should only
> > be present on code paths where we are actually going to defer the sysrq.
> >
> 
> It's not only there to prohibit multiple deferred sysrq (as that alone
> could be handled by irq_work_queue()) but rather to avoid parallelism
> scenarios that Doug mentioned on prior versions.

I'm afraid I'm still a little lost here. I've only done a quick review
but sysrq's entry/exit protocols look like they are intended to handle
stacked contexts. This shouldn't be all that suprising since, even
without your changes, a sysrq triggered by an irq will interrupt
a sysrq triggered using /proc/sysrq-trigger .


> How about the following add-on change to allow passthrough for broken
> irq_work systems?

My question ultimately boils down to whether the existing logic
is necessary, not whether we can make it even more complex!

So before thinking too much about this change I think it would be
useful to have a clear example of the circumstances that you think
it will not be safe to run an NMI-safe sysrq from an NMI.


Daniel.


> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 005c9f9e0004..0a91d3ccf862 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -608,6 +608,15 @@ void __handle_sysrq(int key, bool check_mask)
>         int i;
>         bool irq_work = false;
> 
> +       /*
> +        * Handle a case if irq_work cannot be undertaken on a damaged
> +        * system stuck in hard lockup and cannot service interrupts.
> +        * In such cases we shouldn't atleast block NMI safe handlers
> +        * that doesn't depend on irq_work.
> +        */
> +       if (irq_work_is_pending(&sysrq_irq_work))
> +               atomic_set(&sysrq_key, -1);
> +
>         /* Skip sysrq handling if one already in progress */
>         if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
>                 pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> 
> -Sumit
> 
> >
> > Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
