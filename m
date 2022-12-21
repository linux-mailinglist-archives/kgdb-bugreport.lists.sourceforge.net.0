Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390E653912
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Dec 2022 23:54:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1p87yf-0000Jx-7S
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 21 Dec 2022 22:54:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1p87ye-0000Jq-3B
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Dec 2022 22:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weFVMNvbJ7yqkw6A6XL3qa27dYrMNEUddiQeF4JBTbA=; b=nE8SsGShUeHeDcRzv3/tR2Vh4n
 FUbltsWHnAlqhUkqzGl/Lh/aftjlW5c/sgoIQQCyxOiOfzAdqkA/jrEuWJhDWPtwlIh53GB7wFMs2
 MH1VNRuOA2T4PtQ6NscM5I/AIbjSbutZUgRKFPI9qHxQMXjsqipiY1TB0Sry3wVpKdu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=weFVMNvbJ7yqkw6A6XL3qa27dYrMNEUddiQeF4JBTbA=; b=WBqxHGL4ij29qBaNzkO7jYtwDa
 NSIdrOxqJa/fMVUxgJXZZKQAdf0hcevUIJrjaumlENlLwXcr4lndWd7xCftr3PkiugQbm11X9CyWt
 v79rbOYz32kQvWRW6ftk93w9x6es6nnhKE4W9Wsbf3phxDW/xGO5qan50xLyn9F1liyw=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p87yZ-007GAL-5d for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Dec 2022 22:54:19 +0000
Received: by mail-ej1-f53.google.com with SMTP id t17so1023185eju.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 21 Dec 2022 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=weFVMNvbJ7yqkw6A6XL3qa27dYrMNEUddiQeF4JBTbA=;
 b=UyVIqvam+EQf/26LovkKSu9vHEjWSky+ylVkXOiFMzKSWlm5wYD7HOcsReuQGfxJSM
 0MELjpNNPRAtpHsNUMTKqdfnuE3RutsL3iYibTGmjVAxna4YQ92CWjr7oJRMzdDu3zxx
 a18gc7n5F2olz0HM3P99RbfY522RLWaPvPxLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=weFVMNvbJ7yqkw6A6XL3qa27dYrMNEUddiQeF4JBTbA=;
 b=AJvGG8ZSJdr8+Wl9IF+mmtGmhRgyv2q7sNO3hZZJfJ6ZM8+SkuJLd2i8ii1A8yyhzn
 smYrz0Ig2KSyLZOeLKiUWvGInIHiJtemZzXxcSDmM+CaUWOeISzVL+czb/yEV2jfr1m+
 X4V9X2yl+DOe1snTSWwnOVP1YwIPzaGZqc1oMQCNNrEEROJsLEqvWIWOb6LwK3PkZZoT
 ///isntNlWKOfjh0dpqx4HMrS8j+jimAQZleBPOcty6iqhv/O2oenpEX20V9tP8NDou9
 3v/mKi472rd2L+0O2Z+magabe3WPkw1Q2WECVvjtHnx1R5TRSDSiIU33XrUr4zUd5wVZ
 cebQ==
X-Gm-Message-State: AFqh2kr3/rDlKAYkZk5x0yLVq4PKQJPV65Te6/mFBvJ9S71yZL1YDiQR
 251TrDoM+piqjncsqXY3MvFHZSKmeaX/EDIe0ew=
X-Google-Smtp-Source: AMrXdXsRmbXtI/8OGgV3lU8PsuwvjpqQENivAdYkL1v03CMl5PSAZfGGPZvAJvWVoMPUkWS4PTJzcg==
X-Received: by 2002:a17:906:3084:b0:7c1:23f2:c052 with SMTP id
 4-20020a170906308400b007c123f2c052mr2874256ejv.45.1671663248518; 
 Wed, 21 Dec 2022 14:54:08 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 o22-20020a17090611d600b0073022b796a7sm7699209eja.93.2022.12.21.14.54.07
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 14:54:07 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id bx10so38227wrb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 21 Dec 2022 14:54:07 -0800 (PST)
X-Received: by 2002:adf:bd93:0:b0:241:f7ae:b1dd with SMTP id
 l19-20020adfbd93000000b00241f7aeb1ddmr126901wrh.138.1671663247575; Wed, 21
 Dec 2022 14:54:07 -0800 (PST)
MIME-Version: 1.0
References: <Y6DhewN27vMnfgzT@p100>
In-Reply-To: <Y6DhewN27vMnfgzT@p100>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 Dec 2022 14:53:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WiSVSfCjxXB9eQTx83Cx8+T13AWZ7+r7GZ3p-iLDciQw@mail.gmail.com>
Message-ID: <CAD=FV=WiSVSfCjxXB9eQTx83Cx8+T13AWZ7+r7GZ3p-iLDciQw@mail.gmail.com>
To: Helge Deller <deller@gmx.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Dec 19,
 2022 at 2:11 PM Helge Deller <deller@gmx.de>
 wrote: > > On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[]
 structure > allocates 16000 bytes of static kernel memory, which [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.53 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.53 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p87yZ-007GAL-5d
Subject: Re: [Kgdb-bugreport] [PATCH] Reduce number of concurrent
 KGDB_MAX_BREAKPOINTS
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Dec 19, 2022 at 2:11 PM Helge Deller <deller@gmx.de> wrote:
>
> On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
> allocates 16000 bytes of static kernel memory, which is - by default -
> to be able to handle up to 1000 concurrent kgdb breakpoints.  I might be
> wrong, but I doubt that in real life someone really needs that many
> breakpoints, so I suggest to reduce the number of possible kgdb
> breakpoints and thus reduce the memory footprint of kgdb_break[].
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 258cdde8d356..fab81c4f007e 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -95,7 +95,7 @@ extern char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs);
>  extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
>  #endif
>  #ifndef KGDB_MAX_BREAKPOINTS
> -# define KGDB_MAX_BREAKPOINTS  1000
> +# define KGDB_MAX_BREAKPOINTS  40

My first instinct is that, while I agree that 1000 feels too much,
that maybe 40 would have been slightly too small? I could almost
imagine myself using that many breakpoints while stepping through
code.

...but then again, I guess I'd say that Linux doesn't really behave
that great at having its code stepped through with a debugger anyway.
While it can work OK, it's not something where I'd expect people to
regularly have super long debugging sessions with lots of breakpoints
set and constantly dropping into the debugger and then continuing. So
I guess in the end, I'd be OK with limiting it to 40. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
