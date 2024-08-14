Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 088229518CC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 12:30:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1seBGS-0001nq-5E
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 10:30:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1seBGN-0001na-1M
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 10:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5FuCu3NqJRvNltn8juCtpVQnpUb7NyqPa8u2frEw7c=; b=NosO2PGWm8lk5ksrFQQ/zzpGDO
 yLt/BWZmoPYEvhXKna0e0/uJdrH08FVkHrwttiXWbOjd6Hcoshio7Ua25OEkU87UmK5R3Ll5NYFYG
 +e7OdaIb5f2047mkvGvZUG2QLLGN26YSCaeKBJZDciA7j8Wl3L7GPS3EPmMQj3GH0rDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H5FuCu3NqJRvNltn8juCtpVQnpUb7NyqPa8u2frEw7c=; b=aFYK5toPZD08go6VBY7W+Y4gyZ
 bbesX026dUYd2/oxw3qwjt3zfwfv01R5HYfDjTVC+ya5KpgLMvk8brj9TOtxwLcgUjYSiNwy/i5yP
 VG7PJ9n9SJpW2oPvtTPvbagCG1Wx6u+2c+midexp3N5lIwFwmrzU/lOYwbo8kqFZnXxc=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1seBGM-00062N-7e for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 10:29:54 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso44257575e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Aug 2024 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723631383; x=1724236183; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H5FuCu3NqJRvNltn8juCtpVQnpUb7NyqPa8u2frEw7c=;
 b=w6s3kq2U6Z0LZ0p4qWoPDpvNPIPBOWBTsZR4gG+SHaOEy2zNXN9t+PnsFu6uPQ+xIB
 CZq+/VrKhYuPSINMYfae4KLNjxc2ONiYV8szVsRMcdxsU5lyqtWTWbLulu4EN4VXKDf5
 Xdu74PD4u62LuBpfp1zX7TjfbEj2VWkWJrJ4sFDed/EVstf5IZZRoGA9ZmlGX2T3nPF2
 AW+yKGHS7AAILcShVwEwdahkuiUIXaSnWP9xe+HvNuY0C6faGBBfeuzZqpOzd8828oPr
 T/05x3cBXV3BvjUj8sJxJJjQO1AEEhlhUV60rssueaD6q9lL+aeRomcAAEjEqibwyeMw
 7GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723631383; x=1724236183;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5FuCu3NqJRvNltn8juCtpVQnpUb7NyqPa8u2frEw7c=;
 b=DYIFLms1qe3NMhHI7zpYtTE/6eoGhXT/MJvrkxomF3LCUs+cqSa1CaRLsjfnTHe1sx
 zSMCWS64zyVFu7QVym+L6TBq0IDxbpV40rhppRllZLUyVIZo746VE6BIs6KHPg6c606H
 DQHrZ/i6rV3ZDvoV2aJqWimhumaXJ5z7frpRYKbZEHkas+kZEWzeGEM+h6+jdGT5vYhK
 LemZYRCBJcHkcG20RipzNjl1SbFTR6xyxS7KqydBzrbp3JKT9o8vqREs9ZFS+uMz7UXJ
 MVsh0teBZ3MGvK4/aGFur+WKaQLFrq7paw67CpfamvqPMH7z+NnufRhtadM4Tx6Zx82l
 j8Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBPgie8Dp6ZNduUuu1Lk8qhfZk7uJub7lPVoQ7aWEgvtzNEUl2M5kK14SlLm6Qq52Opr1Vg0GiK5Wqug7+ghc2WApJQtVm34L6aqeXXm8utB97PJE=
X-Gm-Message-State: AOJu0Ywn5Cui667V2tJ0a0pPzO5/XBcLA6WCZw7zDSYWj51xoPtavG5W
 iNXdyyoDEnzqiIoPCYpTJgKdmc2NGsoAEavg4fgRcJUy7J8KMFL/e5pKiZ6SKFM=
X-Google-Smtp-Source: AGHT+IEIZ+M+9sJc4G+wlZV0MZMDBrsLYiiZSlN9aXdqGOAxtY4Ol5fV5IPg+RKTu+K6Iu0NsRkJCg==
X-Received: by 2002:a05:6000:180d:b0:360:7971:7e2c with SMTP id
 ffacd0b85a97d-3717782e636mr1708203f8f.54.1723631382490; 
 Wed, 14 Aug 2024 03:29:42 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4cfeef38sm12345885f8f.53.2024.08.14.03.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 03:29:42 -0700 (PDT)
Date: Wed, 14 Aug 2024 11:29:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Florian Rommel <mail@florommel.de>
Message-ID: <20240814102940.GB6016@aspen.lan>
References: <87wmkkpf5v.ffs@tglx> <20240814085141.171564-1-mail@florommel.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814085141.171564-1-mail@florommel.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 14, 2024 at 10:51:41AM +0200,
 Florian Rommel wrote:
 > Experimental implementation of Thomas' trampoline idea. > Link:
 https://lore.kernel.org/all/87wmkkpf5v.ffs@tglx/
 > > Every breakpoint [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seBGM-00062N-7e
Subject: Re: [Kgdb-bugreport] [PATCH WIP] x86/kgdb: trampolines for shadowed
 instructions
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
Cc: x86@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Gleixner <tglx@linutronix.de>, Stefan Saecherl <stefan.saecherl@fau.de>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 14, 2024 at 10:51:41AM +0200, Florian Rommel wrote:
> Experimental implementation of Thomas' trampoline idea.
> Link: https://lore.kernel.org/all/87wmkkpf5v.ffs@tglx/
>
> Every breakpoint gets a trampoline entry containing the original
> instruction (with a corrected displacement if necessary) and a jump
> back into the function to the logically subsequent instruction.
> With this, KGDB can skip a still present debug trap for a removed
> breakpoint by routing the control flow through the trampoline.
>
> In this experimental implementation, the actual removal of the debug
> trap instructions is completely disabled. So, all trap instructions
> planted by KGDB currently remain in the code, and KGDB will skip all
> these breakpoints through the trampolines when they are in the removed
> state. There is not yet a dedicated breakpoint state for the
> to-be-removed-but-still-present breakpoints.
>
> Inspect the trampolines via:
> (gdb) x/16i kgdb_trampoline_page
>
> Signed-off-by: Florian Rommel <mail@florommel.de>
> ---
> I have been experimenting a bit with Thomas' idea of the trampoline
> approach. It seems to work so far but of course has a lot of rough
> edges.

Interesting. Perhaps a dumb question but is this trampoline code doing
the same thing as the out-of-line single-step code in kprobes?


> I am stuck for now, as I am not sure about the best way to implement
> the safe context where KGDB finally removes the int3 instructions.

I think this would actually fit really nicely into the debug core code.

Firstly dbg_deactivate_sw_breakpoints() should strictly maintain
BP_ACTIVE and BP_SET states (e.g. if the kgdb_arch_remove_breakpoint()
fails then do not transition from BP_ACTIVE and BP_SET). There would be
a little bit of extra logic to clean things up here (each equality check
on BP_SET needs to be reviewed) but the resulting state tracking is more
correct.

Once we've done that we can add a new state BP_REMOVE_PENDING and
arrange for this to be set by dbg_remove_sw_break() if the breakpoint is
BP_ACTIVE. At this stage we can also arrange for
dbg_deactivate_sw_breakpoints() to handle BP_REMOVE_PENDING to
BP_REMOVE transitions by calling kgdb_arch_remove_breakpoint().

That's enough to eventuallyremove the int3 instructions but it relies
on entering the debug trap handler and there's no limit on how long
could take before that happens. For that reason I think the core should
also attempt to transition BP_REMOVE_PENDING breakpoints to BP_REMOVE
after kgdb_skipexception() returns true. That means if we keep trapping
on a disabled breakpoint eventually we will hit a window where the
text_mutex is free and clean things up.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
