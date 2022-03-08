Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC44D1AF2
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 15:49:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRb9M-0000fb-9d
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 14:49:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1nRb9L-0000fP-BI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 14:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iupLQJvgsZ7lCXLV8So/JiMrhE0LlDVXWvrGw7si8ns=; b=PSCdPLSy0CIeLQK5gXoNotLeEv
 1GFNmaXQMjFbGwuV/UvdH0EvvzPzr2HAIcqcmLUYBWFszJpm8oJ+JNYpgaCg5OacOliFJG9v5hBv0
 9etC58EaJCajAwoGpmi7PzBWu2P3RXAru++CR4hoDAcQmRJuXNvDZ+9Aj3NyTK82q5g4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iupLQJvgsZ7lCXLV8So/JiMrhE0LlDVXWvrGw7si8ns=; b=W4/5E3aKPFD+D8dJshFP71pnEQ
 q0pY2jsF6RKYBrDvwMiAG22ML2J/P0V0aFqEcn58e5IAq+otJ+LT8c+b3mtGg7vKIqSfMqudolZp4
 5SwFeP2/yS8EtPjmh3LDcpZNDL/dO5ahyDaX+a5Qj6+Wk6E8vt4++RdUj63TcKF+ZF18=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRb9F-008gZG-Qo
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 14:49:17 +0000
Received: by mail-ed1-f46.google.com with SMTP id x5so24755568edd.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 06:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iupLQJvgsZ7lCXLV8So/JiMrhE0LlDVXWvrGw7si8ns=;
 b=AEFXCwN0FBkNn7abmOdss/zpAb42JT4Fkk8iML8w+a/pDYnkRl/CV9XkicSMJnNza0
 sZm1s9Tanygh/3zCsXBB91uXVMOj4IEXnrXhB4D9fYup9DptR+lhzWMc0sS2grU4KrVL
 fTziO3Qi+dRYXgx558NAiTWjUIChZ1MUre2agq3wiygbHlVnx8BKnho1Cmh7yRSHeynv
 hM/6AIjQy1rPy8XqJcc4fse0y9uEOUCPNihYAuFjuoAmN38fn8CPdXVAZXUhzm2rDjZh
 MFyDC2paSuRPTQpb5wzl8TQmOFBA0qRC3QwbaJy3cMxT6uR5nzrXfhoHRWwKQj52wD6N
 qeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iupLQJvgsZ7lCXLV8So/JiMrhE0LlDVXWvrGw7si8ns=;
 b=Rhdgwkrvdg3l13OgYCrekev5F82IU6cJbehRQwYcP931doVsMTyYUttGmPA/QuvACb
 qSODGexzh4Xju1jV63qfbNCrwNwBYjV1z4bFTZUtmetur2GPsyEt+oShP2mqpAO8lNjQ
 t/b1GKbEs4EVi96/sKOFC4tGOE+hPR9O4Ll2AdkVrOF9nc5Zep+00Zv48kvZuP5ADP2M
 sgz8ciam95Bs7Q1pb0gOMtWDV80jxFB1XIRpjD6x30bRSQLdbHLod3G9OrgkgLXQdIxs
 OsJEOHmJ5yi22628cXLbcqc3Vd7FI8Gfhv3hciaBVEdfyOAK4/fVa8uOznuleV88dpfJ
 XfYw==
X-Gm-Message-State: AOAM530gCbwfzBPWFuqSnPPIJQvkCE0uktfZBVr2PPmmfyuljaB9xiOR
 FS/Sdr9aaY2yM6Vc/KQHi8tZEoJUFcL39jRWOxAlNLsXfK7q5w==
X-Google-Smtp-Source: ABdhPJzpSHaTfLkql6MqsO/zx6ZERRumLVD9HsrUUrBGvSq3NXroYjehKCJTSdrb66KVTytnwwvW6wNphxMcN0BW7z0=
X-Received: by 2002:a05:6512:6ce:b0:448:46c6:b93e with SMTP id
 u14-20020a05651206ce00b0044846c6b93emr1537518lff.46.1646750634776; Tue, 08
 Mar 2022 06:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20220307110328.2557655-1-sumit.garg@linaro.org>
 <20220307142356.ksx7k5xalqlsxnqk@maple.lan>
In-Reply-To: <20220307142356.ksx7k5xalqlsxnqk@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 8 Mar 2022 20:13:43 +0530
Message-ID: <CAFA6WYNdc5fTk61GB2siLj-EkTtRE0u6fq-MtqF3Zt1uwJqJCw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, On Mon, 7 Mar 2022 at 19:53,
 Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote: >
 > Allow a magic sysrq to be triggered from an NMI con [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nRb9F-008gZG-Qo
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

Hi Daniel,

On Mon, 7 Mar 2022 at 19:53, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote:
> > Allow a magic sysrq to be triggered from an NMI context. This is done
> > via marking some sysrq actions as NMI safe. Safe actions will be allowed
> > to run from NMI context whilst that cannot run from an NMI will be queued
> > as irq_work for later processing.
> >
> > <snip>
> >
> > @@ -566,12 +573,46 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> >               sysrq_key_table[i] = op_p;
> >  }
> >
> > +static atomic_t sysrq_key = ATOMIC_INIT(-1);
> > +
> > +static void sysrq_do_irq_work(struct irq_work *work)
> > +{
> > +     const struct sysrq_key_op *op_p;
> > +     int orig_suppress_printk;
> > +     int key = atomic_read(&sysrq_key);
> > +
> > +     orig_suppress_printk = suppress_printk;
> > +     suppress_printk = 0;
> > +
> > +     rcu_sysrq_start();
> > +     rcu_read_lock();
> > +
> > +     op_p = __sysrq_get_key_op(key);
> > +     if (op_p)
> > +             op_p->handler(key);
> > +
> > +     rcu_read_unlock();
> > +     rcu_sysrq_end();
> > +
> > +     suppress_printk = orig_suppress_printk;
> > +     atomic_set(&sysrq_key, -1);
> > +}
> > +
> > +static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
> > +
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >       const struct sysrq_key_op *op_p;
> >       int orig_log_level;
> >       int orig_suppress_printk;
> >       int i;
> > +     bool irq_work = false;
> > +
> > +     /* Skip sysrq handling if one already in progress */
> > +     if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
> > +             pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> > +             return;
> > +     }
>
> Doesn't this logic needlessly jam sysrq handling if the irq_work cannot
> be undertaken?
>

Here this is done purposefully to ensure synchronisation of three
contexts while handling sysrq:
1. Thread context
2. IRQ context
3. NMI context

> A console user could unwittingly attempt an !nmi_safe SysRq action on
> a damaged system that cannot service interrupts. Logic that prevents
> things like backtrace, ftrace dump, kgdb or reboot is actively harmful
> to that user's capability to figure out why their original sysrq doesn't
> work.

I see your point.

>
> I think the logic to prohibht multiple deferred sysrqs should only
> be present on code paths where we are actually going to defer the sysrq.
>

It's not only there to prohibit multiple deferred sysrq (as that alone
could be handled by irq_work_queue()) but rather to avoid parallelism
scenarios that Doug mentioned on prior versions.

How about the following add-on change to allow passthrough for broken
irq_work systems?

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 005c9f9e0004..0a91d3ccf862 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -608,6 +608,15 @@ void __handle_sysrq(int key, bool check_mask)
        int i;
        bool irq_work = false;

+       /*
+        * Handle a case if irq_work cannot be undertaken on a damaged
+        * system stuck in hard lockup and cannot service interrupts.
+        * In such cases we shouldn't atleast block NMI safe handlers
+        * that doesn't depend on irq_work.
+        */
+       if (irq_work_is_pending(&sysrq_irq_work))
+               atomic_set(&sysrq_key, -1);
+
        /* Skip sysrq handling if one already in progress */
        if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
                pr_warn("Skip sysrq key: %i as one already in progress\n", key);

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
