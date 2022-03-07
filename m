Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 995144D0139
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Mar 2022 15:29:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nREMg-0006gP-Dt
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Mar 2022 14:29:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1nREMd-0006gI-IY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIIVvuK2N/32KeIEXgX7T/cu6Rp6fCq2WJv1t+elJk0=; b=Y3Cph8uZl0KO0AT+JEDR1AKTnY
 K+nL+j3cUDrYOm3We3Y4pvYX4c8dsWGvHWvJghEqH8rsHaATBZnUa8yXCikVDLHvKm8jXh7IfttsF
 1DJcxTtKE7J99bfGS4hWM+cY9D+tvBpOTaU0/5K7VnkL2E8QQvt0JvxsnGubx58K7tAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIIVvuK2N/32KeIEXgX7T/cu6Rp6fCq2WJv1t+elJk0=; b=YfbQ3ws5CJhWZOLya6+G1k3fmG
 aRyeRwM1rdKcH5jYjAsZrxu4xK1pZnnKl5uGA0aM4cqbrLfaRusQPGKFa8g0qyxFRGLWtH+QROJEz
 pD5MdlTjGVroMu7lPQE7xoL+vgD/oFHEC+Sfaj3AvaxrTgVRibxb3K+l68cYVEwqO3M4=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nREMX-007SfV-Gg
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Mar 2022 14:29:30 +0000
Received: by mail-ej1-f43.google.com with SMTP id p15so32344986ejc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Mar 2022 06:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mIIVvuK2N/32KeIEXgX7T/cu6Rp6fCq2WJv1t+elJk0=;
 b=F2EkS1OkeFcBz8FzJ1PYrn6nmbbnh/LcjsYdslyLyKZouoZOngfzPhavOHdNWb7ntF
 lMAgQWVFgb49+9jjYedUUgGDvRPwtCEPF3NcY6CddSac5a65ceBDeKdeRDx6SbE2t+BC
 gHnLBtUa4KBEJzs26sxJjjlCII0LOpkjS2+HXgBAsIvNNBZ/RvzRs2LyEfle51GLFuEQ
 +QIzEPukRNOi04Ew6pYfB6zcXlT4hEx0ppXmoFcwMVBY69ad7YNJxhFEuu72csDcx1eH
 xY6WwAFodItq4zPMUqlzV8XDP17LIDgSqj9umFJOElv28rbY7NuoxbVuvoU8Q/yICaoX
 ndSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mIIVvuK2N/32KeIEXgX7T/cu6Rp6fCq2WJv1t+elJk0=;
 b=i+id9vdUw1lTILFSCXmjlzSMgBEkGlB4BavtYGJMCGh4A8VIAqhfCo6SrR+B/5ryft
 vHGS1rHZZ27QmHm1ypSb8eSz8RK7mclejdhaV5csBP68of0ejKMzwJpSLho3Fgdk20iX
 oRnloNHpt7BI6rtlOM4KTIXGUXw/Mqt3R8FNS0klrNiWu7R6RFo53l6atAfDME4pu2ZU
 mDfWVRylJMGbJ4BOXp029gN655WKogLx7D3tTcEvn8hiQH2NglQBgl6T8Y2WuyW/ighp
 yKB3Tp6ggRkBMbqmP803ouZ1EqN6eDKni5u1d0HIsC1VLeYi+b8m4gjyhFMytYWtXjM8
 elAw==
X-Gm-Message-State: AOAM532YxsOj/VvaqvIGoDXPLHZH5mG0pETW3bs5wWn8r4QsFZwWIH06
 Xbwt6t1dIrevdhY5Ndkll5ZRxjYN4PMNf1PI
X-Google-Smtp-Source: ABdhPJzQI4QjqhdFPG0fJBteqt1+29zzxkApr9e/9w3GgGEmpxrbvRqsxvfQsyX3DLpyuuTW1sis/A==
X-Received: by 2002:adf:ea0f:0:b0:1f0:61f6:c3df with SMTP id
 q15-20020adfea0f000000b001f061f6c3dfmr8407228wrm.543.1646663038946; 
 Mon, 07 Mar 2022 06:23:58 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003897e440047sm10853608wmq.28.2022.03.07.06.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 06:23:58 -0800 (PST)
Date: Mon, 7 Mar 2022 14:23:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20220307142356.ksx7k5xalqlsxnqk@maple.lan>
References: <20220307110328.2557655-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307110328.2557655-1-sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote:
 > Allow a magic sysrq to be triggered from an NMI context. This is done >
 via marking some sysrq actions as NMI safe. Safe actions will be a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nREMX-007SfV-Gg
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

On Mon, Mar 07, 2022 at 04:33:28PM +0530, Sumit Garg wrote:
> Allow a magic sysrq to be triggered from an NMI context. This is done
> via marking some sysrq actions as NMI safe. Safe actions will be allowed
> to run from NMI context whilst that cannot run from an NMI will be queued
> as irq_work for later processing.
>
> <snip>
>
> @@ -566,12 +573,46 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
>  		sysrq_key_table[i] = op_p;
>  }
>  
> +static atomic_t sysrq_key = ATOMIC_INIT(-1);
> +
> +static void sysrq_do_irq_work(struct irq_work *work)
> +{
> +	const struct sysrq_key_op *op_p;
> +	int orig_suppress_printk;
> +	int key = atomic_read(&sysrq_key);
> +
> +	orig_suppress_printk = suppress_printk;
> +	suppress_printk = 0;
> +
> +	rcu_sysrq_start();
> +	rcu_read_lock();
> +
> +	op_p = __sysrq_get_key_op(key);
> +	if (op_p)
> +		op_p->handler(key);
> +
> +	rcu_read_unlock();
> +	rcu_sysrq_end();
> +
> +	suppress_printk = orig_suppress_printk;
> +	atomic_set(&sysrq_key, -1);
> +}
> +
> +static DEFINE_IRQ_WORK(sysrq_irq_work, sysrq_do_irq_work);
> +
>  void __handle_sysrq(int key, bool check_mask)
>  {
>  	const struct sysrq_key_op *op_p;
>  	int orig_log_level;
>  	int orig_suppress_printk;
>  	int i;
> +	bool irq_work = false;
> +
> +	/* Skip sysrq handling if one already in progress */
> +	if (atomic_cmpxchg(&sysrq_key, -1, key) != -1) {
> +		pr_warn("Skip sysrq key: %i as one already in progress\n", key);
> +		return;
> +	}

Doesn't this logic needlessly jam sysrq handling if the irq_work cannot
be undertaken?

A console user could unwittingly attempt an !nmi_safe SysRq action on
a damaged system that cannot service interrupts. Logic that prevents
things like backtrace, ftrace dump, kgdb or reboot is actively harmful
to that user's capability to figure out why their original sysrq doesn't
work.

I think the logic to prohibht multiple deferred sysrqs should only
be present on code paths where we are actually going to defer the sysrq.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
