Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDF4C6EA9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 14:57:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nOgWa-00007h-9l
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 13:57:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nOgWT-000076-Vk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 13:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z95cF48vKkHrrcUfc8C+R6WNLcHc8VGni046CUf80ko=; b=SQYtJ9PRzK5uV48BHuA6TlLsIW
 tI6dzu+n/MsSKbj9YIGiVh3nSOJElDGLnVo3sHMr4pkS0VYdLjcgtgZfYpcmXa6HhhDlLmfzRbZEd
 Er91kR5hVc53SWgKBYXPtP1R1EUCfWJh3NZDF6fHvZvLFt9CdJiPYETd2hp+tfW7il78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z95cF48vKkHrrcUfc8C+R6WNLcHc8VGni046CUf80ko=; b=VG/3LS8T+M4LoE/1rH6uM71kws
 ApYr4O88m2IB0f3WaLAJSeTWG2NzUmtv/OiBtksEdcNmHJXYSObzoiNkHeBPkPcxRX20yT0bRzJJr
 CZ236miNehrsatZfbYcVMeo9qasDPVmUrjBC+KblGB/mxTGZrdfY+FBf/dzSpIe47N50=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOgWO-000Ao1-Gl
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 13:57:08 +0000
Received: by mail-ed1-f54.google.com with SMTP id s14so17766854edw.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Feb 2022 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z95cF48vKkHrrcUfc8C+R6WNLcHc8VGni046CUf80ko=;
 b=EuLfa53u8OUzG+YbGwJE+kA+/HV7IWKx5amvI/SrfXXY4XwAAoEJ32CYLBx+Vdmq5H
 k066NxXDATnP3H7xqKbq7xMFs7e0GCQCG3bAxIsH3vmROv4Ls+cnpdLtuJbFB/HprhFR
 jW+N0OHOYji/PcDdbwhoWNe3fErvzOQtqfqwj19YnLpmzjEeJkXW9MuJ/jH5kXe9zj5w
 Ps/oXr/ULMKkr9p9+PT8huh3FEbEjCXrDCCEyiztgRy5iQCddARFIZUMZEX+5IiK3+Qq
 sD2rZ6sxF2S1oVw1XgMIOuDq33ObIlThjsoC9ghq5IbFpgLz9Twcj8jjTk13qmEB0ccP
 wohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z95cF48vKkHrrcUfc8C+R6WNLcHc8VGni046CUf80ko=;
 b=sUiP+qohxit/pd8Zqmz7h82VPcAb0vkgwV6ITtz8mgcKKtqNsBS/7lhCKTUDqHr9bL
 RSloIUfyTazOeb/iTV2tNIQ9NTdzdorsGyDrEQ/6vBvITvrCZ1uo3v/rCWqFqNM3hLxp
 fPLiPNd0ug5UM1PQE7zx4avVAOegrvW8u8s7bSngw7LV2iYSFeDGil/n4nnjwTfF1/BN
 oB4yZaISH0P3puuik/r4ePYY6PXsZ7vmtRPL6AXw9RHXufRKS0y94VUq2rGc+RkcXkir
 4T5YlSz8vu04e+uSeVwKRYHb0z1DauQryo7fFwbxT7c7cRkGSOFYSvDeLKwFjtO2+bZB
 pkXA==
X-Gm-Message-State: AOAM532GKYSsovhYQmj48kwhW2J0GxOx3rD9AMcwZHLRETSyjhf4YTkp
 NdmYsoE2BEZEZdiiVh4QLo2OSCBMTB9Ug7MVFjKHFrPLcBE=
X-Google-Smtp-Source: ABdhPJwaUVVHNGdaO/Krh/XriRHNGuiNqCYK9mJmJyceWKMVKRYCq5S6hcUkZlOyPEWYg0mbqLpEPwwACXwZohGYh+U=
X-Received: by 2002:a05:651c:b8c:b0:246:c5c:84d7 with SMTP id
 bg12-20020a05651c0b8c00b002460c5c84d7mr14053716ljb.15.1646054894256; Mon, 28
 Feb 2022 05:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20220228075351.1412452-1-sumit.garg@linaro.org>
 <Yhy7AnwEMqbcKsEg@hirez.programming.kicks-ass.net>
In-Reply-To: <Yhy7AnwEMqbcKsEg@hirez.programming.kicks-ass.net>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 28 Feb 2022 18:58:03 +0530
Message-ID: <CAFA6WYN1XOxuVZscd1=oovE7Cf8UZxySYq4Lp=QSsFDndYSNUA@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Peter, Thanks for your review. On Mon,
 28 Feb 2022 at 17:37, 
 Peter Zijlstra <peterz@infradead.org> wrote: > > On Mon, Feb 28, 2022 at
 01:23:51PM +0530, Sumit Garg wrote: > > Allow a magic sysrq to be triggered
 from an NMI context. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOgWO-000Ao1-Gl
Subject: Re: [Kgdb-bugreport] [RFT v2] tty/sysrq: Make sysrq handler NMI
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
Cc: hasegawa-hitomi@fujitsu.com, daniel.thompson@linaro.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Peter,

Thanks for your review.

On Mon, 28 Feb 2022 at 17:37, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Feb 28, 2022 at 01:23:51PM +0530, Sumit Garg wrote:
> > Allow a magic sysrq to be triggered from an NMI context. This is done
>
> *why* though?
>

I should have copied the reasoning from v1 cover letter [1] to this
single patch as well. Will do it in v3. The basic idea is to enhance
kernel's NMI debuggability for CPUs stuck in hard lockups. As an
example, one should be able to launch kdb as well as other diagnostics
offered by magic sysrq in NMI context.

[1] https://lore.kernel.org/linux-arm-kernel/1595333413-30052-1-git-send-email-sumit.garg@linaro.org/

>
> > +#define SYSRQ_NMI_FIFO_SIZE  2
> > +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
> > +
> > +static void sysrq_do_nmi_work(struct irq_work *work)
>
> That naming don't make sense, it does the !NMI work, from IRQ context.
>

Will rename it to sysrq_do_irq_work().

> > +{
> > +     const struct sysrq_key_op *op_p;
> > +     int orig_suppress_printk;
> > +     int key;
> > +
> > +     orig_suppress_printk = suppress_printk;
> > +     suppress_printk = 0;
> > +
> > +     rcu_sysrq_start();
> > +     rcu_read_lock();
> > +
> > +     if (kfifo_peek(&sysrq_nmi_fifo, &key)) {
> > +             op_p = __sysrq_get_key_op(key);
> > +             if (op_p)
> > +                     op_p->handler(key);
> > +     }
> > +
> > +     rcu_read_unlock();
> > +     rcu_sysrq_end();
> > +
> > +     suppress_printk = orig_suppress_printk;
> > +
> > +     kfifo_reset_out(&sysrq_nmi_fifo);
> > +}
> > +
> > +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> > +
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >       const struct sysrq_key_op *op_p;
> > @@ -573,6 +612,10 @@ void __handle_sysrq(int key, bool check_mask)
> >       int orig_suppress_printk;
> >       int i;
> >
> > +     /* Skip sysrq handling if one already in progress */
> > +     if (!kfifo_is_empty(&sysrq_nmi_fifo))
> > +             return;
> > +
> >       orig_suppress_printk = suppress_printk;
> >       suppress_printk = 0;
> >
> > @@ -596,7 +639,13 @@ void __handle_sysrq(int key, bool check_mask)
> >               if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
> >                       pr_info("%s\n", op_p->action_msg);
> >                       console_loglevel = orig_log_level;
> > -                     op_p->handler(key);
> > +
> > +                     if (in_nmi() && !op_p->nmi_safe) {
> > +                             kfifo_put(&sysrq_nmi_fifo, key);
> > +                             irq_work_queue(&sysrq_nmi_work);
> > +                     } else {
> > +                             op_p->handler(key);
> > +                     }
> >               } else {
> >                       pr_info("This sysrq operation is disabled.\n");
> >                       console_loglevel = orig_log_level;
>
> I'm missing the point of that kfifo stuff; afaict it only ever buffers
> _1_ key, might as well use a simple variable, no?

Yeah you are right, using a single key buffer should also suffice. The
original idea was to queue multiple sysrq and handle them one by one
but that turned out to be unsafe.

-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
