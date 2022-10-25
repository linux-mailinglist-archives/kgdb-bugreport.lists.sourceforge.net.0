Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258960BFAA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:34:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on7tf-0004jU-Ts
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:34:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on7te-0004jO-AY
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=njSAeeEWS4YTFoFUiTIV452Wm8jZRn/VS5t9bD4jpSw=; b=Q+G4oY7Ip3dhFQB1wpEegQCMaa
 7qUC81HZYfhpDnZKexrOs1lMaWOsf0g7MDoiX72AWyL3zcdAL1JwO9hpGpFXHQ5QIXf/96m5NrN8T
 rFdXpOVkdzLEOL0Qxlbg2fF7IL9HJxfTUxWKxpKQdvJAo1MfpBS191buczSlJYDB03kc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=njSAeeEWS4YTFoFUiTIV452Wm8jZRn/VS5t9bD4jpSw=; b=XbpmkQWbiMM1p+X2RVwNZo8dqJ
 W5V9kQxdpqA62hT2V04Ke72ToMuMATDp/gBp+37HL406trdxOZ+4HCg65wun1ecRygq7ZcQfjmees
 GgYIW/9ubm1QVs/2ehtG2UO4IHSf2H7Q4pEKQfl/R4kjugmjXoZ2OK6F75d6hF/DFEIY=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on7td-00GDvS-BP for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:34:22 +0000
Received: by mail-ed1-f45.google.com with SMTP id b12so34074625edd.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=njSAeeEWS4YTFoFUiTIV452Wm8jZRn/VS5t9bD4jpSw=;
 b=Zs5ZG44XK6uYkMM2kvzLquvdTYQabPJs6GmRjz64lCMMjMcN4yFTyUa3U3l1zZlS/3
 luA9yvHgX+ddv8Olw4MiBPEC0ZtCCkW/eddixOLkvRLZnFOOk84DafQ9XLq0O5QapXzn
 yYbWlG4Rc1xGqRYpgBcXZd9GP+hJg0pZWif6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njSAeeEWS4YTFoFUiTIV452Wm8jZRn/VS5t9bD4jpSw=;
 b=iVGctzgg1a0WKE7FEBQbtbUJQZsiCy5AoOkVGZeGHVhKwQhrcau2N4pvtGyl8gkr3V
 sejOhXyCZjcooLxa32yMKSY3TZGyQnK6rVPKP2cYs4x/XNVxyq+MD0e9e7JI9OoBQN08
 ApSybvwpIWL9YyLgLMNK0rCuaYWx9l4UtvJTV5S8xuTI8Jt9Kl8kYZUdPsDtfpiXuTaB
 hQ9CFipNeK+A8tR1xFVGzi8V5z8s1oxGIfJzC2ycAscZMuaCnHsz3aZRNUh05yABLEx1
 h8yMUcdx1LorGMlNLUBal4sOindihgJiQQIO6HEnl15rElSSNh4BySGowu97VWImOtFX
 4iqw==
X-Gm-Message-State: ACrzQf0xdBQnFScUj09QYJYHGLVgavT6FhLNLMR6CQ8SNrKtfXMyNbu9
 OJJNYQk7r5MNtLuezV+798ssWwt8s+SibBWm
X-Google-Smtp-Source: AMsMyM5K8665olWTCBr2uqW99T5FjsNIUVvIBWmBKIdV+qsb5qwm+nw26n83KxS9aTUk+fQ1pq7RGg==
X-Received: by 2002:a05:6402:555:b0:461:a144:e949 with SMTP id
 i21-20020a056402055500b00461a144e949mr9816995edx.45.1666658054243; 
 Mon, 24 Oct 2022 17:34:14 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 sh39-20020a1709076ea700b0073dc8d0eabesm565598ejc.15.2022.10.24.17.34.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:34:13 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id z14so4958727wrn.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:34:13 -0700 (PDT)
X-Received: by 2002:adf:f641:0:b0:236:737f:8e00 with SMTP id
 x1-20020adff641000000b00236737f8e00mr4369053wrp.659.1666658053078; Mon, 24
 Oct 2022 17:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-20-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-20-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:34:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=GCzDu+YvGLCvhwW=2W=CFmZO78smQu6c5xwZoaT86Q@mail.gmail.com>
Message-ID: <CAD=FV=V=GCzDu+YvGLCvhwW=2W=CFmZO78smQu6c5xwZoaT86Q@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Replace (console->flags & CON_ENABLED) usage with
 console_is_enabled().
 > > Signed-off-by: John Ogness <john.ogness@l [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.45 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on7td-00GDvS-BP
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 19/38] kdb: kdb_io: use
 console_is_enabled()
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
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/debug/kdb/kdb_io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
