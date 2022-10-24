Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA756099B9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Oct 2022 07:22:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ompuo-0006mp-Ry
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Oct 2022 05:22:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <senozhatsky@chromium.org>) id 1ompun-0006mg-R7
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Oct 2022 05:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XkglCD++rBAhdxJENjRjV84ieq2zA95yE5d2YHv3MX0=; b=DDY4m/gn4d1hMUFgJ+Hw+yWd/e
 HbTx90i5lmT4IVoYs3zJt35hRCofvBZWzHZbC7yLkEh+iJwz5hbMClnqH/E0dw146P5zWgemIOrNq
 9oelFG1zHdBkfwemwtxTngPJ4IqfufHs78csXRJh5IriGIxissSQly4CqLimWwVOKiHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XkglCD++rBAhdxJENjRjV84ieq2zA95yE5d2YHv3MX0=; b=gYmc0CVIKqCc8jXCfXiloFzK02
 1dwdE+3JDR2dTNF464rVxE53Gae6IMzs0XDLvZwdVdEkk97eCnxTlYmBhu7yCgsQnjyne5o6PKxaY
 YLrMMYcBvdieaJJAMFDHlNMjdOwMoovxA548IP1uvXyACtezW49/Y7xPoQQj1XIJk9Rg=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ompul-0007a8-Up for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Oct 2022 05:22:21 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso6348063pjz.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 23 Oct 2022 22:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XkglCD++rBAhdxJENjRjV84ieq2zA95yE5d2YHv3MX0=;
 b=JiBw3jcj5dZjnLXiFYmma44ug6rDhKqzzO2PeInT/NL0kLYWKOAomexSB2z1lQL+CA
 c+x19Orgq18ANdKDFm60I4FNtW/2TzibSnc/tCubjhP8rVCWMzti4UMe285iZqliuvl0
 udO1sl4xsvMqikTC7S+p1trak7bUt1GuOZ+BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkglCD++rBAhdxJENjRjV84ieq2zA95yE5d2YHv3MX0=;
 b=8PArVKElQPSI2kOxwjlvJYQrxemfwMGEMCWLku5d1RAy+JNKldskYVI7TzoSy8PZwG
 vPD1iVLV/e04JXe2iaE3rRmsh4eMKoYyz79/32SmiWrkYEuj/RnblIm8B9UCAO2N7E55
 nyTHORv7WTzyA4t78IOou2h1+xwo2voFUkc/5PV5l/+muAnTZEKiEAWwRLWEYqn8U+FR
 6iNz2NV/bRa9VHk3JK+M26rdzyFOAkSwO0dfLmQJGCQ+7R53ivvxhhRO5UzN1D1lVQGx
 D2Lhad/OCaF0NjgR1gIiitQnr8ZLhkfUxlHO3yQgaT3oWomyQmY2WIALickugqPoGrlU
 4krA==
X-Gm-Message-State: ACrzQf2VD06okGBvS4UsPdPR2mRTkVLDdnkMIRlxUzEheq9NWwyU/g1d
 MielbAyHvmFVGt0v5CPtM8zaog==
X-Google-Smtp-Source: AMsMyM63AapOxi4cQFnaRsxgJpIJLodlUlAw26IgKyPUf7Uk5QLSRVJ5YYvF7MVj77tlMmuvRTVJqA==
X-Received: by 2002:a17:90b:11d4:b0:212:ee83:481 with SMTP id
 gv20-20020a17090b11d400b00212ee830481mr9470051pjb.36.1666588934331; 
 Sun, 23 Oct 2022 22:22:14 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7f0e:f6a4:8d85:37e4])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa79e1a000000b0056203db46ffsm8571912pfq.172.2022.10.23.22.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:22:13 -0700 (PDT)
Date: Mon, 24 Oct 2022 14:22:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y1YhAA9T5edwFnu4@google.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-2-john.ogness@linutronix.de>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On (22/10/19 17:01),
 John Ogness wrote: > From: Thomas Gleixner
 <tglx@linutronix.de> > > Unprotected list walks are not necessarily safe.
 > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de> > Sign [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.49 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ompul-0007a8-Up
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 01/38] serial: kgdboc: Lock
 console list in probe function
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (22/10/19 17:01), John Ogness wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Unprotected list walks are not necessarily safe.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
