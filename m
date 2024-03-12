Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E9879187
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Mar 2024 10:58:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rjytm-0002ZH-0t
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Mar 2024 09:58:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rjytj-0002Z7-BW
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 09:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XRrd/mRYiuVNaYDbIbSa1EEqn9i8XS+3pxvuW9JmMSQ=; b=h0BnqbeZzZQKdgVq05PvG0ZVfc
 S4Dkv+o28AjfIx1Zl1bfc+E99VQGe5R1Sp4n+OHJwerbaTCeCS26FhL6FW2U5bB1pO+npUjgj8jq7
 TPz7yxrYibNyrCB76R+3FuDmX658KpZ/M+qh7E8tcRwMDTZEnA/9jRWJRugFsRZKoXLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XRrd/mRYiuVNaYDbIbSa1EEqn9i8XS+3pxvuW9JmMSQ=; b=fnmdHmBnixPqxTwYaeXrsHozJW
 WZ3kLuv4k8gmS8Hx1zmkRIQmlxr/CJ6GbcyC0ZMNASPcx8BbOuACZb3AMIObv3VuZthYz3gu5zY2K
 3WPOMOTosBE8KykzMyRW74iJzs5gwg6cF5dddqQT1Y3ciuKySJTE05BglSPEdqqeaojw=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rjytY-0002yn-9A for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 09:58:14 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33e6aca1ca9so5164161f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Mar 2024 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710237479; x=1710842279; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XRrd/mRYiuVNaYDbIbSa1EEqn9i8XS+3pxvuW9JmMSQ=;
 b=D7l+qQFsY4HYzgEnuzJ9EsF/DkxXXnjY9+MfdSITe/Q7xiLY/9Cd1S+I1yfzaWZM7B
 bToW+Phen+lgdsE2DU0ujJRenuzlm1a0V7erkxUtPbt2kiEqVuweH48y3DmXE1lo8eup
 yyZkGkNbh4imKrInpFecu5fSgaEW2a2kDq3S5X+C8lBuSy82YM0YIYQGWa/Kykqj7gRL
 ahtPP12+0paffVGtByvsvH7+YIDjrltDZeMUb6ja56BkOR9DKl6bsbEU8CZ88JT6bblE
 kAWkyT0gTRSOSxHgW1YrA90RHlAUJCYD0jpfh1tPx3OarCvnlNC1xcObhrElMYF1JVy8
 mnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710237479; x=1710842279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRrd/mRYiuVNaYDbIbSa1EEqn9i8XS+3pxvuW9JmMSQ=;
 b=sB6vM10PjRA8csfSBkXWVDUFhoqjwis4uIh/E5kPvmGq/6msG7MK4YDwCtkYTLlc0Q
 7LbKcA9FG97NQlQFu2UnAjcHbx4RzJgGDrJaoq0VCa49ckIfqzQDdQTtlX+RelPrGhpO
 5fFRgprMNOU9Mb5A4UDvEMPVaPXsg6wmZJmunxr4zEcl6l35YsAVBHILreajX9uE3m2i
 WIKGQ8NrmU531vwGfwUKiwr8uGiANZODA2lXjh1gY3b0j10CIhn6yxpyin97WdB75U3B
 sQcmfKiRpCOfCJT6PZP44/XRDncjvMIt3yk0pZcoWqF4rbPZZ/nE88vktBZnoxPKwYTt
 2JwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhm0z7HckDcBOtN7bCnOZqxywWZ3e9BMgJaifZ5kc8rtZVh0m1GXhH+OCb7bAb4Ucvy7icJtin57Jaf+6K3I5qkzKjMEBojs4dzZO+Nx6zy7uVpMI=
X-Gm-Message-State: AOJu0Yw0bdlBozgaPb66X8cnm7WefbLSOVP/n257cI0Q0Lz9NXnNBMhl
 E3XUL2YCYBCQggIRAYVVbBzLnLcPi0Wslh7JFAnXUVbE8fYb/cdB/wfaHKVfFqg=
X-Google-Smtp-Source: AGHT+IETA/fhuKCiOQdvs/qQPMu8fwiw5YqR4JFWLLA9lS90bkIdlBJzwgAtJ7p3egiNO9bXfcY3Hw==
X-Received: by 2002:a5d:4306:0:b0:33e:7fcb:c0e with SMTP id
 h6-20020a5d4306000000b0033e7fcb0c0emr874687wrq.6.1710237478891; 
 Tue, 12 Mar 2024 02:57:58 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adff143000000b0033dc3f3d689sm8594544wro.93.2024.03.12.02.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 02:57:58 -0700 (PDT)
Date: Tue, 12 Mar 2024 09:57:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240312095756.GB202685@aspen.lan>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan>
 <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote: > I
 know that you said schedule_work is not NMI save, which is the first > issue.
 Perhaps it can be fixed using irq_work_queue. But even if > irq [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjytY-0002yn-9A
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSF0ga2Ri?=
 =?utf-8?q?=3A_Fix_the_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
> I know that you said schedule_work is not NMI save, which is the first
> issue. Perhaps it can be fixed using irq_work_queue. But even if
> irq_work_queue is used to implement it, there will still be a deadlock
> problem because slave cpu1 still has not released the running queue
> lock of master CPU0.

This doesn't sound right to me. Why do you think CPU1 won't release the
run queue lock?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
