Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B82628971CE
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Apr 2024 15:59:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rs18p-0004D1-Uf
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 03 Apr 2024 13:59:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rs18o-0004Ct-ED
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 13:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TQNlFkl/iPl6kEZxvkBf9c7pV/p9E/CfhbTLpQyyNlU=; b=O43ZqwVBdrpD6Wk6yC1oQMfFnm
 mQUezowIqy8ouZ1jnb+v2CEKx3RswOFB8iaJqMDhkxlE0ya/fKEyOTqEwZ78wsPMgpyY1ToRKeJn7
 T7PD/26DbPeYBgKD5FnWJ83vjtlIt6pSnbSQoiC3+j+nm78tUEc2jRh/iafi3XBlCeUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TQNlFkl/iPl6kEZxvkBf9c7pV/p9E/CfhbTLpQyyNlU=; b=a3P6Pq7EUjrhnSSOgnX8hArVe/
 9W9SUURwa2nq2WjrQAfq7sQF7bzK1JdzSnG6cHvejVT5wf/3poQGuYajTQYtiP3fsVHZWYIQheaNi
 NKh3nMXdxSMeXgjsQ/y5snItiwjoogFewOncw7jOUn03kTfSo3HF2Xx+rvUnenj4tV3Y=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rs18j-00037t-Ru for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 13:59:02 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-415523d9824so44906585e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Apr 2024 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712152731; x=1712757531; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TQNlFkl/iPl6kEZxvkBf9c7pV/p9E/CfhbTLpQyyNlU=;
 b=kLe9JjZ3Z6Zj6k4KL/M41wchBdJqeRkBHg84ycX8it0HMwu8F+En/nVntQrkxkVH6L
 I9xHxssiFLl7nXn+6JxhQJ3N1wj1c9xFEVTs+ZfAfjAh/ObM5IFSRf1ZiVY4gSsjTI/1
 gvSYi7pmHRYpPn5zDlWM2snAQYcJGlQQwkHKhy5wG59GrABJsg1zRAtPur4Hc+lMtuzU
 Kln2hfumj1WhJs3JPhbDZId4l3sLZZevKXH1/V1OfdnQmIlB4Li51JqFrjErfbiY4yUl
 AbVoIUYAMRIuG4m6drb+caKWYmok4ACYLIh2JkHFEIAtRVtZhdaU8UgEJMlNXNU09ZdT
 0B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712152731; x=1712757531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQNlFkl/iPl6kEZxvkBf9c7pV/p9E/CfhbTLpQyyNlU=;
 b=XM4be3avZ6T7ByiNTTiXAbpCBVoX0aEztho4YEYwRC/r5ffXrgcGhwwTS+dEVdPMWS
 efgwSKhFgjljzy9GbJyFv68W1tZDcBO3qr2VNj0eHEwzVoiaQN887h+nX/EaCZE026wj
 LGbo39O2OZYvyz6LCLYnTgXe+0PcvYhH+2Tao62MhYRpwcICHlzCpSELReuPtkQM8ZYk
 QYJZvGp9vML8ApQYVrsQR7QIXkPZuEY+e2Ka63hwXMW0YKEhr8+hJaMmfiypJMiQAtLd
 QFRueW23KS5aQzpn1+xzVm+drlKviqYpfe4Edx2GIk+Y9x52TOzyZ+jxD+wVhW4QOoKN
 3cAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWocQsUjiPxby9alcn/WFaUUxWkOUqFzFVX1x8gYErxspfiNLLLZe11O/YW0hazcPyaztrS1QHG7pX7rSU8rXPF82Nx87i9jeoMf0QS+VNPNH0MvPM=
X-Gm-Message-State: AOJu0YytIOPIUCNEmFHlmd570px01iMWm1Y5t+WtW2TJn/IsuUP0k7HC
 0vdcQdBYA0QdbSOKgb1q0KdaxNxvmXWN2Y1BvHz8YbiRG94o63gTrRLLEHCqMdw=
X-Google-Smtp-Source: AGHT+IHeqNDBA/AfyKYzWvB+jEZxaoUQEyY/aylIOI09KkhqbTFndAoM1/OE52+0lZPrdJynAwVY/A==
X-Received: by 2002:a5d:4bc6:0:b0:343:72e3:df00 with SMTP id
 l6-20020a5d4bc6000000b0034372e3df00mr4208682wrt.49.1712152731627; 
 Wed, 03 Apr 2024 06:58:51 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v21-20020adfa1d5000000b0034399b0713fsm1541588wrv.18.2024.04.03.06.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:58:51 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:58:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: liu.yec@h3c.com
Message-ID: <20240403135849.GE25200@aspen.lan>
References: <20240402125802.GC25200@aspen.lan>
 <20240403061109.3142580-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403061109.3142580-1-liu.yec@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 02:11:09PM +0800, liu.yec@h3c.com
 wrote: > From: LiuYe <liu.yeC@h3c.com> > > Currently, if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will > attempt to use schedule_work() to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rs18j-00037t-Ru
Subject: Re: [Kgdb-bugreport] [PATCH V8] kdb: Fix the deadlock issue in KDB
 debugging.
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 03, 2024 at 02:11:09PM +0800, liu.yec@h3c.com wrote:
> From: LiuYe <liu.yeC@h3c.com>
>
> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
> attempt to use schedule_work() to provoke a keyboard reset when
> transitioning out of the debugger and back to normal operation.
> This can cause deadlock because schedule_work() is not NMI-safe.
>
> <snip>
>
> We fix the problem by using irq_work to call schedule_work()
> instead of calling it directly. This is because we cannot
> resynchronize the keyboard state from the hardirq context
> provided by irq_work. This must be done from the task context
> in order to call the input subsystem.
>
> Therefore, we have to defer the work twice. First, safely
> switch from the debug trap context (similar to NMI) to the
> hardirq, and then switch from the hardirq to the system work queue.
>
> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

I'm happy with how this is looking. In the long term it might be good to
move the keyboard resync code so it is with the rest of the kdb keyboard
code rather than in tty/serial. However I certainly don't want to tangle
that kind of clean up along with a bug fix so I think this is ready to
go now.

@Greg: I assume you want to take this via the tty/serial tree? I
contributed a fair bit to the eventual patch so a Reviewed-by from me
probably isn't appropriate but if you want to take the code it is
certainly:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
