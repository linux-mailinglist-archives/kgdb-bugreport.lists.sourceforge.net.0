Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C3912A99
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 17:48:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKgV5-00015M-CD
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 15:48:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sKgV4-00015F-Mh
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TeYCibzE1FMc2+yjflvUxrtJIB+urVCuXOvaaTvmc2o=; b=m0su0pMIY1ZWBo02HKbh4nggD/
 6eOn62knd3eH0XcoDDAlRAf5fnOH7Aygy2LDYzC5hF8/wB49WiAROR96l3L8d39ZI8HC8RBc1GHv4
 Q2xUS+q3O+8iZcpmum4NJpTx4+7cuwjQtIAqrfy4M0zdp2IW+WYfPjb2LGD9u1YHSs6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TeYCibzE1FMc2+yjflvUxrtJIB+urVCuXOvaaTvmc2o=; b=fowqYcrIRSL07ijW2uySMIosEf
 KMUvW+f1p8z4CC9lO14tDkUljQe55pkXw3C8DOgmBMKhYEISYzPQDNgTfJDUe7LthaIWmLaYvntso
 oj5+jOKSdHo1kgyBRMbDlWDys2A5zUU+wg+PgpOlIcS7jtLnSd4H+lYYimIZuGY7wQps=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKgV4-0004J6-5v for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:29 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-421b9068274so20368705e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984898; x=1719589698; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeYCibzE1FMc2+yjflvUxrtJIB+urVCuXOvaaTvmc2o=;
 b=UqUw2drrLQY3PJPa14huJ735HkIih0Kj3V5mrTFb4oG1EF/txw/BnZAhFboLJNdl8F
 L2CM6KGgNDxnF3Vmi6iwo49gxtCTpoviaLkMLjkL5anOvh5UkdBVc2bN+Or5Mfk18LVs
 hx9pmZEV8CQCAvNcyAnfAo8lLfU9XnjSXGU+InrNo4Ni/5QNzfqGs+E4GEfDqR7wsm6A
 fwE5dal2A7Q1yHRE8Rcy93U1/lhIYHpw1QsQbab8CuXhYSU39vaEr8AEJglUrmvl8egJ
 nbZeRWwLUlC1qsdQmFiRMlYX+3qNmDIfj6NK8NaoNJSxuOkhqVkI9hbmn5J8PTgFCETB
 VHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984898; x=1719589698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TeYCibzE1FMc2+yjflvUxrtJIB+urVCuXOvaaTvmc2o=;
 b=jM7xpkBDCmXXdfT8KQi0rjpICVBRGKvAdeMpsw87NStODytY2lZqTjFh4VgEwu1yOp
 gHrZnaG3uAxffzFjJbJUxmtAEsm6SKQU+BycgMc8wThqL/JNtJ9y4fZvwphNwx2Q5xk/
 DD7LGAAZwTNQDJphPAGWIXFU/YPtG0fmNPOGi4UGjrUk6Avmq57NX4uwj8UZqfvc3f8x
 6ab2glOS0Hsuhu44qj9TXuQ+PbRGSIRbIO4Sg+l6iXWmdktxZXeCuu2M8+3suEEzR/VN
 SGIDk5bU+V1I+cmPWzM9wA8GCfrQwKkHk8kfD9bn/ljkcgVajkARzAXO5IS1lc+SyRKM
 fDAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI5x2S35hyIlX1Kg1ao8hlS8GEBPZdI22WAuyCKj8dWJ68p/T+PE4jMx9MTqFsKBqiwg+hfaTkLF6e/hq5O4QvdZI8gaoW9cZudnfSVsEJgy0zD6w=
X-Gm-Message-State: AOJu0Yzm0p7Ku2RcU1MKMuJBaVW5v4flWJcAtklHLR5MjHlhjz7A9s7Q
 WsKWaOEa0nal6kl2z88XnTqc7cLXukMGXSsDvjy06j4IufmJyQTiOutDXG+1dTo=
X-Google-Smtp-Source: AGHT+IFf5NTkDyCSPgZQfUPuBtU1jcsGWI2tWgppmjl9Td6O0N5SvqxpaFGGYxUOcuq3uZUTigxzdQ==
X-Received: by 2002:a05:600c:3549:b0:421:7e0c:f876 with SMTP id
 5b1f17b1804b1-424752a8e97mr63390855e9.41.1718984897902; 
 Fri, 21 Jun 2024 08:48:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be9fasm71314525e9.16.2024.06.21.08.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:48:17 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 16:47:51 +0100
Message-ID: <171898481989.314245.7629196450962213270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528071144.1.I0feb49839c6b6f4f2c4bf34764f5e95de3f55a66@changeid>
References: <20240528071144.1.I0feb49839c6b6f4f2c4bf34764f5e95de3f55a66@changeid>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 28 May 2024 07:11:48 -0700, Douglas Anderson wrote:
 > The function kdb_position_cursor() takes in a "prompt" parameter but >
 never uses it. This doesn't _really_ matter since all current calle [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.51 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.51 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sKgV4-0004J6-5v
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Use the passed prompt in
 kdb_position_cursor()
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
 John Ogness <john.ogness@linutronix.de>, kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Tue, 28 May 2024 07:11:48 -0700, Douglas Anderson wrote:
> The function kdb_position_cursor() takes in a "prompt" parameter but
> never uses it. This doesn't _really_ matter since all current callers
> of the function pass the same value and it's a global variable, but
> it's a bit ugly. Let's clean it up.
> 
> Found by code inspection. This patch is expected to functionally be a
> no-op.
> 
> [...]

Applied, thanks!

[1/1] kdb: Use the passed prompt in kdb_position_cursor()
      commit: e2e821095949cde46256034975a90f88626a2a73

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
