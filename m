Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B36B2305
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Mar 2023 12:30:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1paETj-0007Ta-IR
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 09 Mar 2023 11:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1paETg-0007TT-1N
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bLSYBu7ENu/iqBo4/duVdnjboh/ioAkNKuem/I0F9jE=; b=Ei+Tmj0K8RXLyOcjbEKlUTe9lU
 E2Q3DDsC+jxiO7wyyA40Y/STpcQdh/EsuBRHt+uBvFmHU0KnKV8hC10X9V7IjsN96LiG49yJKYxkw
 tTd05ncpdA+00dO1J7VDJ8eJv99X/36y8H8fUS4Xzt5X2Enj14ibHv84/A0hxoG4w1ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bLSYBu7ENu/iqBo4/duVdnjboh/ioAkNKuem/I0F9jE=; b=fdOXjwB7JNz4BQRYIrtqdREu0V
 xKtgNB5+YY0VZ28FObpnruWth5t4a5A0swRkxUeaN627jhpBQaOCFMFwoa0U1h6HMxT0j3RSKDAMX
 NsbPafiHAwPbD0E/p61v+Yof6LDhMKWiI8I/8kYAv8n39CvsM55/NDcYHtvy20ke6V6s=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1paETd-002Cug-VC for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:30:33 +0000
Received: by mail-ed1-f49.google.com with SMTP id g3so5688417eda.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 09 Mar 2023 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678361423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bLSYBu7ENu/iqBo4/duVdnjboh/ioAkNKuem/I0F9jE=;
 b=dIJZiBccBfhqw/cVnHpviV8WzVM6jCZbvhYKLN/A8Az47IQMPEWSb0KIX02sPQpIuC
 PtOChknGVSmGautnIv9ljV+x8HTrK1j0OXHtHlSjREHgRM0W6zVbPSGLjLj2Wj9ewzw7
 9vlMO/xoM+OgvNCOv9h7Zg6shtnRUmMzB/5a24HtcJ3Gry4yEml8Oj9wEFrRXocVicrh
 mWVCcA1xy25S6i9dAs9UG8nEPuak3MJ9odcSZcNUWuKu0WJWUmha/kpKStK68SDEaHdy
 SMc/epDNd0ukjZPaC071iOqzsH+nS5gRfLXsh+BnQ5nCGm/790c9O93aw9ljl1p9V+5b
 L7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLSYBu7ENu/iqBo4/duVdnjboh/ioAkNKuem/I0F9jE=;
 b=sLIUThIwEeIND7ffSJcGp4fwmm700KlNNESABPhhDHbgKqZ/evw/GjZGtfn2Hr+p19
 mvJKj3D6ZY+aja3Foh/2YaipCYPWVJurjtqFl1XlmWA+xH8Jl8M2b+q46tchgD0IT9QM
 7tjMhkrPGqP4KMdk7pneccYWaEJdg3Ed6PMpD7yK0hlTlG7BemfW4ktDl3Gh6mRpioP9
 1cTRnEdHjK37cb0dinFFGxR/dzr7NHPQwPceT720y55/q2zzPbqF1uWakJMcBY/edVaI
 j4V6GtYuTXw/rhcCdEiNkXIesiqlnn27TpIcC0U6sYGbA9osi94goHdKPeyIDYxvxmUv
 Tr+g==
X-Gm-Message-State: AO0yUKX3ZE5PE7IFcGDq8L+OlxAlTz1y+E0mXlRDdT7s/kjLNyEHozde
 MdYUo3s+q2Zs0dndwedIwFy3lw==
X-Google-Smtp-Source: AK7set9FdwRWO7tWwWvc0AAD0ohk+wLhwlAGK/c8n+w7TnRlfcirm+4MobcRi7vokXL4IypyCINobQ==
X-Received: by 2002:aa7:ca54:0:b0:4ab:4569:4b9f with SMTP id
 j20-20020aa7ca54000000b004ab45694b9fmr20403988edt.0.1678361423229; 
 Thu, 09 Mar 2023 03:30:23 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 i18-20020a50d752000000b004accf3a63cbsm9399632edj.68.2023.03.09.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:30:22 -0800 (PST)
Date: Thu, 9 Mar 2023 11:30:20 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20230309113020.GA78621@aspen.lan>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230302195618.156940-2-john.ogness@linutronix.de>
 <20230309105240.GA83039@aspen.lan> <ZAnCXxui+QiNNRb6@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAnCXxui+QiNNRb6@alley>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 09, 2023 at 12:26:23PM +0100, Petr Mladek wrote:
 > On Thu 2023-03-09 10:52:40, Daniel Thompson wrote: > > On Thu, Mar 02,
 2023 at 09:02:01PM +0106, John Ogness wrote: > > > It is allowed f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.49 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1paETd-002Cug-VC
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume
 write() callback available
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
Cc: John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 09, 2023 at 12:26:23PM +0100, Petr Mladek wrote:
> On Thu 2023-03-09 10:52:40, Daniel Thompson wrote:
> > On Thu, Mar 02, 2023 at 09:02:01PM +0106, John Ogness wrote:
> > > It is allowed for consoles to provide no write() callback. For
> > > example ttynull does this.
> > >
> > > Check if a write() callback is available before using it.
> > >
> > > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Any thoughts on best way to land the series. All via one tree or can
> > we pick and mix?
>
> I would prefer to take everything via the printk tree because
> most changes are there. Otherwise, we might end up with non-necessary
> cross-tree merge conflicts. Also I would know when all pieces are
> there.
>
> That said, this seems to be the only change in
> kernel/debug/kdb/kdb_io.c and it is relatively independent.
> So, it should not be a big problem to take it separately.

Enthusiastically
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

That suits me fine: kgdb is pretty quiet at the moment so, whilst I
can't predict what patches will show up this cycle, this probably spares
me from having to put together a PR for a single patch!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
