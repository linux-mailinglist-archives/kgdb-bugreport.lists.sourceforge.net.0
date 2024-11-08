Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7A9C18D4
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 10:11:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9L18-0000g6-Gm
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 09:10:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1t9L17-0000fz-AE
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=; b=OMIDdv03zzOodCB0/2JHFVRREl
 chQ7aI0tokuKFWa9jD6vFO64CryOsCvRluuc9Fr8scijWHIwqZPE9eWsS9TrlEHxOvHn2IO7viFBN
 5PDlt0cWpkotW2cnW1lEym9WpXTtcbz2xas1rQ1F5DWVqSGvz2yk8Xbo87ndZ4ZAHRV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=; b=UvcShSUZp5VoxtQCbCjuIHSv8t
 8UVi6a5kl0WZqRk19fGzub0rtlb3fUWLVcRGOYvyFxa37s4KDfiSgFQW7kGPKWsY7/PWKLtMfawNc
 JAZVFHssVhJwZJRVOqtSQekHRgKIKB340aSJi9W7Ni/jDPX6LONr0Oi15SemkuqP/l2I=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9L17-0002H1-Ak for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:10:57 +0000
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so507917166b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 01:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731057046; x=1731661846; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=;
 b=iv8FQ4hS/FnFB+0t3LMr6YOLTfRSWBzN4Hx47ucm18cfw4eucoFsUYTApdWonC7Hdd
 12sYTzgVNbGZxspnlR9A5K3tXC9ewxn/UXe0xKT5Fu/iwtLn6UUscHznvFAm2ukgdihV
 /5VanUifrR/E/BccTtt/mok4BfsXtTvgjclseQbyXqnW3497OHgIgoAb3895AeuZRktX
 BX9yCBv5eeCVKA3Wdw/tgKz4gswbnUA1k8B0NqgBx4UevhFRT/zHOu9kXv4Kf7j60xZu
 Z8+aiNgCcYQOYn6hu+VzIDkYIzTtgiCkxuEYxUfnPB9A+XmPjMrTSgXTAuETHnGMW4Bs
 jarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731057046; x=1731661846;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=;
 b=ltwZsPYLMeNZb5FAM1UiKrWK+bCzRnyvDu1j8TmJiRMKPe7N62DBlYDL6oEGyC4dTP
 cKcrrbOn66viOOQ6M+Cl/zEOg9P+MPcQYxoaEtRJvuLRyNC17ClTHeM0Nkr1Kv7zCW1a
 N4NXD8MYP1ARm4ZMSh0bu6aqzNp44ErH678R0e78p5FGbN+o0pTXdOs6ntdSlhdKh2JQ
 mOEU/qXhhT/Evb2NOuXLrUkL2eXSBCCe81SEMHG74fZobo17nD/7r9U8DitFqQk+mfo2
 fSI5yWOiWiDpOF6mrRFGhSA5nxqAKcQMdIidD60bkZWzJvKQBlaeKq6jfQBck/Defr+S
 Dx5A==
X-Gm-Message-State: AOJu0YxJumMceSobnjFglUNRgXJxbfCzzNQtuFxwDcujIOa41fRzt0O7
 BTv1A29UMV9NZ4qJiC7bXMLhB1pi/3HUZA31ZEH6PuxAklAwxoTcdHEqZN+xNmSyfHHpdpTZ5CM
 bnyXb9A==
X-Google-Smtp-Source: AGHT+IGjJsYkKtS++GK0c6xcy/PKYqPkLYH/DrLydQt+yXOAMvFiy8YV5KZWq/ekW1oi9PjQAEWzfg==
X-Received: by 2002:a5d:6f1b:0:b0:381:eba9:71fc with SMTP id
 ffacd0b85a97d-381f1c83b8cmr1500678f8f.19.1731055116277; 
 Fri, 08 Nov 2024 00:38:36 -0800 (PST)
Received: from aspen.lan ([89.101.241.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda05f89sm3889986f8f.98.2024.11.08.00.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:38:35 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net, 
 linux-trace-kernel@vger.kernel.org, Nir Lichtman <nir@lichtman.org>
In-Reply-To: <20241028191700.GA918263@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
Message-Id: <173105511502.10030.8958584403113767756.b4-ty@linaro.org>
Date: Fri, 08 Nov 2024 08:38:35 +0000
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 28 Oct 2024 19:17:00 +0000, Nir Lichtman wrote: >
 The simple_str* family of functions perform no error checking in > scenarios
 where the input value overflows the intended output variable. > T [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t9L17-0002H1-Ak
Subject: Re: [Kgdb-bugreport] [PATCH v4 0/3] Replace the use of
 simple_strtol/ul functions with kstrto
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
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Mon, 28 Oct 2024 19:17:00 +0000, Nir Lichtman wrote:
> The simple_str* family of functions perform no error checking in
> scenarios where the input value overflows the intended output variable.
> This results in these function successfully returning even when the
> output does not match the input string.
> 
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
> 
> [...]

Applied, thanks!

[1/3] kdb: Replace the use of simple_strto with safer kstrto in kdb_main
      commit: fe0c87871fc0b97f6d374b670c81f7c4087eebc5
[2/3] trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
      commit: c56642c737fc0bd9bcc3a22a2bf8ed6f5900a660
[3/3] kdb: Remove fallback interpretation of arbitrary numbers as hex
      commit: 5f4ca702e36893a276fccb0aa55ab36e19dfbb50

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
