Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F22654581
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 22 Dec 2022 18:11:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1p8P6c-0003Ci-Bg
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 22 Dec 2022 17:11:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1p8P6b-0003Cc-KO
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=duYQ9iq37MIQZD9FFK5lfFkr/6xJKjPye+uLcYBOKE8=; b=LtjM33eyEuqUtWb4+z3J+Ox0Mo
 kBe3yaGMcn44Nde35B31AdZA70h/VRzYHSiO72FgBIJe0p4QTH8mVqZz1/Wy+UjGSifiqPPn+Uub2
 DuctT4QVBRe9V72ZLLRW0z5BNXLV0sg9Ar52hOQyYcbvIDgxEGqELheAitwbdS0eaBFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=duYQ9iq37MIQZD9FFK5lfFkr/6xJKjPye+uLcYBOKE8=; b=YLerdinii8GzbDQ9JUgdzTOn+H
 ZuYj44ExmblcQwO0x4i3BuoNskOsY/zXQ4baSowZWE7sz/kd1vSSmvAtTrgH1cc84IIi94iUAkO0r
 B79O/8A1LVgAGgJxNNIffXigOnNQtMzApM30stlTaETpJH1m3odgooViype2LhYu7F6g=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p8P6U-0008ON-69 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:11:40 +0000
Received: by mail-ej1-f50.google.com with SMTP id qk9so6433367ejc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 22 Dec 2022 09:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=duYQ9iq37MIQZD9FFK5lfFkr/6xJKjPye+uLcYBOKE8=;
 b=sABt3q8p22HzuDlWjoUE/mR+ytHLofErGaBo+JXqGJ2jpiTcLuaRb0fxB2nm+xZbHx
 ohNYT2Hix4yVAx/jsuMa5WeLZlfJCb1yAtQkq4XQFD7e4+WnwaU0HsBegRGkjliwzk1c
 0TjnkZjOuYuk0nJMmvvisSFJhUcDe3lXSZZkkK6Oetzo4Lct5S6/slOmnmYeJI6gVkI/
 MpwZMVz08KeNaXtlXofwtEaMlEPhHWLX2VgSQHbfYMJ+LveTrzVPYNR/G/jxIli9gIle
 LrZrsxBqWndsdycqI+jkncqIZfP8T0nLcCcdmxmkZuJQ+GqNL4Wpg8uGwTvrdXKSiMma
 /BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duYQ9iq37MIQZD9FFK5lfFkr/6xJKjPye+uLcYBOKE8=;
 b=EBFjIw2UVl9KPsyOETw3JXpkXqqMtX3aey+tl/Rt2uj6/DhOO46YEbMYtTJRQURkxF
 /Qhwjz06TLb1cCHw6wnUF+xObuVF0Ux5SG99blC6QBnD43YfyfW1f1niSuPyX6ggX8Ho
 W0IaHYrV1k5yFJTuw5WR8MziPZesu8lPzd8h0fv9Cqxg1Li86nsWbk3uYIfrM+2Rw/jQ
 JHzbZgHe6Xn8ir66IP/Gc3E3RcY1jpL937VwuJMAI31xiGt95NHFvQhedSNL0PVW9UkA
 48dXrokdbooWmvS3l/8fKyhtHhf29AyRdxkGvWk01Y638+Mgo8V63rKueSsin5pIJlmH
 m46A==
X-Gm-Message-State: AFqh2kpZ3cTBoy45MDxhuMYVqlDVi/9HlVLA1dnyPJAkWlclbsTDIXua
 8E63GVj1GHMfICdFKEG3bP8olw/IgQWrDmR2wRw=
X-Google-Smtp-Source: AMrXdXvJbFNWSQAgt2UzW+o3g9vfX4Wn8D1tGmRbjxSj1lER+Q16g1iiB7GesYv3C4oN5BgV1bErDQ==
X-Received: by 2002:a05:600c:3d98:b0:3cf:d70d:d5a8 with SMTP id
 bi24-20020a05600c3d9800b003cfd70dd5a8mr5004047wmb.6.1671727785164; 
 Thu, 22 Dec 2022 08:49:45 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003b4ff30e566sm14625462wms.3.2022.12.22.08.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 08:49:44 -0800 (PST)
Date: Thu, 22 Dec 2022 16:49:42 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Helge Deller <deller@gmx.de>
Message-ID: <Y6SKpn1Zaz9aZN1Y@aspen.lan>
References: <Y6DhewN27vMnfgzT@p100>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6DhewN27vMnfgzT@p100>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 19, 2022 at 11:11:07PM +0100, Helge Deller wrote:
 > On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
 > allocates 16000 bytes of static kernel memory, which is - by [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p8P6U-0008ON-69
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Dec 19, 2022 at 11:11:07PM +0100, Helge Deller wrote:
> On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
> allocates 16000 bytes of static kernel memory, which is - by default -
> to be able to handle up to 1000 concurrent kgdb breakpoints.  I might be
> wrong, but I doubt that in real life someone really needs that many
> breakpoints, so I suggest to reduce the number of possible kgdb
> breakpoints and thus reduce the memory footprint of kgdb_break[].

I am somewhat dubious about this change. 1000 is large but if we place
a breakpoint on an inline function this can result in many breakpoints
being set (they appear as a single b.p. in the gdb UI but kgdb will see
all the inlined sites).

As such I'm not clear why 40 (which risks breaking some use cases) is a
better default than 1000 (which "only" costs us 16 to 24k).

If somebody really wants to debug a system where the memory costs cause
serious trouble then I guess we could entertain a config option
(defaulting to 1000) to allow for such tiny systems. However it does
need to start from "we really need this memory because..." rather than
just because "16k is a waste".


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
