Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7474E9B3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Jul 2023 11:02:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qJ9GA-0000Io-Sm
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 11 Jul 2023 09:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qJ9G9-0000Ii-TG
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 09:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hvH8IFA66UBhNAUcAjxTeC2EGoXW4NGa//k1MlXqT0=; b=jmdN51orVM+Vzxy5MVD4WF90rA
 jYWxKIIjxBR/yWS4jtuelw/Px1j46F4+66zHA78TF/M4m/TQbxdrm1JglWI/qlPpgCr1K+W918k0I
 SC5Ycs/MzRBjTFwVi4zmcgh9zlUmle9Q33zibblSFzygVEJ9VRnLCAp4UozaUb8n9/a0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3hvH8IFA66UBhNAUcAjxTeC2EGoXW4NGa//k1MlXqT0=; b=STmBBq0kGXFPmgRMnibxIbrjY6
 fPxOu0n9bSTqcBIRkyvet1rNLZdF7RTMkZIU4ndOM9Vw9wV/BC4gIzuKy3rmbffE2MpZ7/158MOwW
 V4BcQ0n0dE+wdJIox8gfGhpd1MOl4HBLbcKlh8HNmOL9D/32hF/1wooMEMJT+FIDFzYU=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qJ9G3-004AhF-3N for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 09:02:14 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso55925435e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Jul 2023 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689066117; x=1691658117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3hvH8IFA66UBhNAUcAjxTeC2EGoXW4NGa//k1MlXqT0=;
 b=SOqfnFBVQJFtudwrqaybdzD8Mh3tVRj8j4I33Ik48exr9ztGtl7Ql8Vf3L1JBN8Xlo
 N1SsrphZPDaJOE8g5GotGZ2hXkvb1aPqkqjXgHiQJinX8PdPsMXEdpgZh5yUtG7Sm04L
 TljJr/dZ1Th9AtCh60FMdN539bAnlZwyedkMsAvsEQkczEkan0Wu2uV6DOUCIEzszRNn
 ZaIYE8eK9xWFCtJX0bnZlFdiPYcWAui92FOULCwgvzWnbpHqvw2WTxIg3g4c9L7S678y
 G04QpVcMgfSF+FxhtzJTYdCTu+HlukxVOFudwm9ILyZKzZe7DZBqzMOGtTySJCYqEuJ7
 s5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689066117; x=1691658117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hvH8IFA66UBhNAUcAjxTeC2EGoXW4NGa//k1MlXqT0=;
 b=jHlm06luN8DzzC94aRJ+yQRhJdUPsxi658yUi4kKGjKbcgVufScxLQAoAvV/Ymix6u
 4S5sWTwcCvdXOpyrVvq5jGaf+gellsHXwc8uS200lX/Q3TBAyjb4B3kKJUfvnaRb+ipv
 qEjBu8pNtcK3/3xjo6H07DYZ9uZYkPfmbVwwJz9gjpe6WAVCeZv2QYb9APJZCH1e8Bv4
 dJyJmz5K0M9R/SFl7o89cdjpWeIGWisfDA0D0hq5lkXXc2DAd5TDmUKnx1TaARSTiXNv
 erEXvV7hmSSehcwucTyCQ0GtRXkoYf2NEjcbDd02+nVBCuBx0N7kuBdTc83LLrO9OwiL
 17Mw==
X-Gm-Message-State: ABy/qLaHvmyT0kFQiCLmzFtWHJS6LlEoM2IhnkONzkXsvxgrWVAwlmUr
 B8HIIpNinDwRhk9MTVnVvvrqe66EpWKCQz5yjTdAAjOD
X-Google-Smtp-Source: APBJJlFQTm6HbSpXbJ386CGPmzFm581e/edg7ZOLI8tH/qSSi3hWytLKK1DBX8XjruF1n4yopcIUDQ==
X-Received: by 2002:a05:600c:28c:b0:3fb:dff2:9f14 with SMTP id
 12-20020a05600c028c00b003fbdff29f14mr13932119wmk.4.1689066117394; 
 Tue, 11 Jul 2023 02:01:57 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c025200b003fbca942499sm12323236wmj.14.2023.07.11.02.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:01:56 -0700 (PDT)
Date: Tue, 11 Jul 2023 10:01:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20230711090155.GB26224@aspen.lan>
References: <20230710134524.25232-1-john.ogness@linutronix.de>
 <20230710134524.25232-2-john.ogness@linutronix.de>
 <20230711082339.GA26224@aspen.lan>
 <87lefmq0yk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lefmq0yk.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 11, 2023 at 11:04:11AM +0206, John Ogness wrote:
 > On 2023-07-11, Daniel Thompson <daniel.thompson@linaro.org> wrote: > >
 For v1 I shared an ack rather than queuing the patch. Although rea [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qJ9G3-004AhF-3N
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 1/5] kdb: do not assume
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jul 11, 2023 at 11:04:11AM +0206, John Ogness wrote:
> On 2023-07-11, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > For v1 I shared an ack rather than queuing the patch. Although reading
> > the thread back it is possible that was based on a misunderstanding
> > (https://lore.kernel.org/lkml/20230309113020.GA78621@aspen.lan/ ).
> >
> > Anyhow, it looks like you have designed the new series to be picked
> > individually?
>
> I understood that Petr will carry the patch. Yes, this series only
> includes the non-atomic/non-threaded cleanups so that it will be easier
> for Petr to send the full series off to linux-next.

No worries, that's fine for me and from my point-of-view its still:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> For this patch there is nothing left to do. I should have removed the
> kdb people/lists from the mailing. Sorry about that.

To be honest I'd rather be in the loop than out (and with that title my
mail filters would jump in it anyway).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
