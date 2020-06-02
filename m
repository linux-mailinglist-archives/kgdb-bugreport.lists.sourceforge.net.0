Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6791EBD4C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 15:47:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jg7Fy-0000tG-Sb
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 13:47:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jg7Fw-0000t6-Tl
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 13:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qSTMEdvjk3TF6RfwsS1dypnjhMY3GyU5XrIVPs/JS5Y=; b=f34YNGOm2zTBybJ78i1AWMDeg1
 9LrtfXaQrue/TSSDgoTzVCqCcbEhm9sR183pof33P08TLgUTJAWzTwGJJZ11Y/XUmpGB5uOALI2IC
 /ircCNC6S4HZOdfgrEyobIPTh2bG8YHzEpufKOfe916neCFR2Uj336pbKCfiOJJmbflU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qSTMEdvjk3TF6RfwsS1dypnjhMY3GyU5XrIVPs/JS5Y=; b=h2afb5AMT8Uq29Y/R49IZJ2VpL
 hxlYxn239dnIdExcsgDSe5FehzfolS2vJXd1/x3q3v/sYgBHs8mY5mQWHlrDlGErQ3BjwTPmDHpCp
 0tSU1XcqRPLqCTMVAzzOq7u3XDba8gjCpT0CTVPA9Ka7iXIWwK2EhYX4S1ayJxr63QKU=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jg7Fs-006VEx-DJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 13:47:04 +0000
Received: by mail-wm1-f66.google.com with SMTP id d128so3221251wmc.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qSTMEdvjk3TF6RfwsS1dypnjhMY3GyU5XrIVPs/JS5Y=;
 b=Y1TD+V2YHn6cONPIQz2HtNHu42aROGvx5fTK74Y/eXE/BpTSFPKO97aZAU+6LAcDD2
 9eGLijRbtxLbjqHPVYMtMMWMCX4L71GKSR/D3vk3ONBGn0ZuUSYzaZzOPzUwhVTfkdyL
 m9kqQJBKc26Wx6iXh0OJu4ne5z3abM4GnbYFvR4NRbx7c5ilsNggcNXt0gP1y8QDdcY+
 C4HHl3457Vo4dPJ7/dl2BbymecQiJdYL0NvVKWjpfH44stka49Jtgv9CbYEqOhKxBIPb
 SV8zjJVZ8Mqi35YB5QHQJC65BR7b/m7AAL8BMfG4q8jE/a/1tygDsEeYknjTIy5ZB8n2
 sl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qSTMEdvjk3TF6RfwsS1dypnjhMY3GyU5XrIVPs/JS5Y=;
 b=Mm2cDZkFw+6IGac7j5AiCWQkcZdKCD8FRE+HX1GYfnWNjuk7FvpS+Sd/6HmlrSqozl
 2sysGXzO3Q1sovj5fDwaMj8nC9j0vnp7vB0oAWGtIJhMZdc/Sn39rtmdD9TkstB90+dF
 ORjaKYSLvuq72Z+mihDIO8xfAVJoCQ84YJFlQDG8X/E0apyWMQwHpE9o+qID+5Q9J9EB
 cRrgeHrYtwyhJ/FfClkXBRn6Mi8cXJQIR40iXqIGOOazHr3HhUBTqFG4AXvzjC2RLYH0
 zbpRT+HRK4piiBLNq9OHtEtJc7rhMqct96opjsdbHIiP29w04UnhbsE97lf9/lUfaY9c
 4m4Q==
X-Gm-Message-State: AOAM533RU7HwwDLP87QnofMa5p/qDpPTqU7jb/NXk9Di/lSDWeNDDa0q
 ITpn9jqqSoiO4EI5MbA9QbTEi7fF2so=
X-Google-Smtp-Source: ABdhPJyjTmzSO2w5j42gGxx21vuAkkZvWzGoUQv7gnIV0Xj7BY0fEtNOZY9l9pz9e+Qlxp8caIOedg==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr4170692wmb.119.1591105613992; 
 Tue, 02 Jun 2020 06:46:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d13sm3407055wmb.39.2020.06.02.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:46:52 -0700 (PDT)
Date: Tue, 2 Jun 2020 14:46:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200602134650.mdovxoa6cj2hgvei@holly.lan>
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jg7Fs-006VEx-DJ
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 29, 2020 at 04:56:47PM +0530, Sumit Garg wrote:
> In kgdb context, calling console handlers aren't safe due to locks used
> in those handlers which could in turn lead to a deadlock. Although, using
> oops_in_progress increases the chance to bypass locks in most console
> handlers but it might not be sufficient enough in case a console uses
> more locks (VT/TTY is good example).
> 
> Currently when a driver provides both polling I/O and a console then kdb
> will output using the console. We can increase robustness by using the
> currently active polling I/O driver (which should be lockless) instead
> of the corresponding console. For several common cases (e.g. an
> embedded system with a single serial port that is used both for console
> output and debugger I/O) this will result in no console handler being
> used.
> 
> In order to achieve this we need to reverse the order of preference to
> use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> store "struct console" that represents debugger I/O in dbg_io_ops and
> while emitting kdb messages, skip console that matches dbg_io_ops
> console in order to avoid duplicate messages. After this change,
> "is_console" param becomes redundant and hence removed.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Looking good, only one minor comment left on my side (including the
three patches prior).

> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9e5a40d..5e00bc8 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -560,12 +560,14 @@ static void kdb_msg_write(char *msg, int msg_len)
>  	if (msg_len == 0)
>  		return;
>  
> -	if (dbg_io_ops && !dbg_io_ops->is_console)
> +	if (dbg_io_ops)
>  		kdb_io_write(msg, msg_len);

Since this now slots on so cleanly and there are not multiple calls
to kdb_io_write() then I think perhaps factoring this out into its
own function (in patch 1) is no long necessary. The character write
loop can go directly into this function.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
