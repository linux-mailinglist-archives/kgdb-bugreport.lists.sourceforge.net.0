Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD0810DC4
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 13 Dec 2023 10:57:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rDLzn-0007OU-Fs
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 13 Dec 2023 09:57:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bayefall19961996@gmail.com>) id 1rDLyI-0007MR-Ah
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 13 Dec 2023 09:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ARe7rqBf7yKSMXb7AlYZ6ze0oABUfz9XCcvA6Ozl+dQ=; b=dJsnaRr8fN90Teqeg05jK9f5dq
 f4XZLN3JMy6kOCqY/Y0ggu7FW5GIxJEXTljrh7vV/Y9xa5C7bH9tBykKBZb4lCJ8OgcazmLALpjIh
 UKZKgfTyACeYoDdK9npN/dC8gbJU0K60coIfC+/2Ln0oEYrbrceX28Hm723fnn/k1QvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ARe7rqBf7yKSMXb7AlYZ6ze0oABUfz9XCcvA6Ozl+dQ=; b=k
 B2hFSrU8DIZ58Mb9xDWPRFiITltGpPjbADKSAo6qJd7lrMUThtoi9Wrby6gWHGsNoSRfzW2AY5Rbd
 yYb3z6s1dsHT/csACUoJNiks7Ibg8Kn/VF3KEKJ918naeIsZRQbiAVd2G/WxRUxnPeHAZu2dOaN7h
 crfSAHijoMr4YaLI=;
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDLyF-0000ON-5h for kgdb-bugreport@lists.sourceforge.net;
 Wed, 13 Dec 2023 09:56:06 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1feeea75fbfso4507961fac.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 Dec 2023 01:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702461352; x=1703066152; darn=lists.sourceforge.net;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ARe7rqBf7yKSMXb7AlYZ6ze0oABUfz9XCcvA6Ozl+dQ=;
 b=N3tgauRAZH16LOBp+SitdpDXNofXxKIN9jYIsWO++kn+DKlUt1AJ1sBOBib5fPZzru
 G8zb6QSlVdg5AZ4KDnCDlfQKf4LkhfBfH2sIydsS+gJiOPDLIXvcH/Gax62MqsxXdB6G
 ahAb+N/FpcnBxxJL3koFucOTv7ufiM7Ndaz0GOPPELK8+g8TfVNSTsf6bbnOqnupvfL6
 +u6P7Dyk7WKq7z+1Df5MfUfckJWD3MLhj/vSXAZuzCWyU32THAz9gMsv4z7SDP7MQQe1
 +qu8RtbgEShXa5e55JTAgy5pecEdqp1+oS1ToyFObznBEaa+RoRrV+trFS5r40UDLc46
 iv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702461352; x=1703066152;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ARe7rqBf7yKSMXb7AlYZ6ze0oABUfz9XCcvA6Ozl+dQ=;
 b=il+PRseEpg2idyek5f39NBEzyp9RPP5y/XosnKJP7y+wvPirWiH+kOPdvd8L3q2I5y
 vk5kpJhjw4L2t/k7aDY9GnhJNZXtUrLXeoCPAUNPqG4svKKSogVT1aVYyXY8uhMSoZa3
 aV2L8ZrpzkdVxaLIHG+MxCN1TLp7gzmOKDKJHYMuma5xNhsleywqcwD587tclsbht4Cs
 VE972gioakyJ2f7LkdBqp53JMMclVX0avS34tm6Cs8qMDlEUSvBOMNVVrfxJvsax1Kzc
 JiJPjldxFSKPUDX2QXxzM7q5+ISHOjMfPqU+nINPowJMMZXkmMcTyMQVlloz2Xx7FJlO
 JKNg==
X-Gm-Message-State: AOJu0Yw0JZskDtrSRpLsFeS9R5lpTwbTD74ZFFY1SFdgd6BV4kADD+42
 8j5CxDCPCwD0QTSnv0ZkO7iUc+bS/ILf1h3UBM8=
X-Google-Smtp-Source: AGHT+IGF0wbV1CEGPq/POnSWr5f/ISxHNxDjJdmRcCMjurHU26HaSZm/0ORvyg13M7qMJ3GmxApWHPUm7fzHVFPmaXQ=
X-Received: by 2002:a05:6870:f80a:b0:1fb:75a:c427 with SMTP id
 fr10-20020a056870f80a00b001fb075ac427mr8104364oab.80.1702461352333; Wed, 13
 Dec 2023 01:55:52 -0800 (PST)
MIME-Version: 1.0
From: NUZNA UBAX M <ubaxmuznamaxamed20@gmail.com>
Date: Wed, 13 Dec 2023 09:52:54 -1200
Message-ID: <CAKzcOj8hVF=GVf=Z44zC2yAkR=t0oPC-RMY61zsrS1+y0fbGqg@mail.gmail.com>
To: undisclosed-recipients:;
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, ,
 / I got your email from // jpn.nec.com // I have an urgent
 discussion with you Hi,,/ I got your email from // jpn.nec.com // I have
 an urgent discussion with you 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.52 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [bayefall19961996[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ubaxmuznamaxamed20[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
 0.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDLyF-0000ON-5h
X-Mailman-Approved-At: Wed, 13 Dec 2023 09:57:37 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Kgdb-bugreport] (no subject)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,,/ I got your email from // jpn.nec.com // I have an urgent discussion
with you

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
